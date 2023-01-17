require_relative 'film'
require 'nokogiri'
require 'open-uri'

class FilmCollection
  attr_reader :directors, :films

  def self.from_list
    uri = URI.open('https://www.imdb.com/chart/top/?ref_=nv_mv_250')
    doc = Nokogiri::HTML(uri)

    films =
      doc.css('td.titleColumn').map do |film|
        title = film.at('a').text

        info = film.at('a')['title'].split(", ")
        director = info[0].chomp(" (dir.)")

        year = film.at('span').text.delete("()")

        Film.new(title, director, year)
      end

    new(films)
  end

  def self.read_from_txt(file_names)
    films =
      file_names.map do |film|
        lines = File.readlines(film, chomp: true)

        Film.new(lines[0], lines[1], lines[2])
      end

    new(films)
  end

  def initialize(films)
    @directors = films.map(&:director).uniq
    @films = films
  end

  def show_directors
    @directors.map.with_index { |director, index| "#{index}. #{director}" }
  end

  def select_film(input)
    @films.select { |film| film.director == @directors[input] }.sample.full_name
  end
end
