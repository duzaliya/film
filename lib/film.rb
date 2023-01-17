class Film
  attr_reader :director, :title, :premiere_year

  def initialize (title, director, premiere_year)
    @title = title
    @director = director
    @premiere_year = premiere_year
  end

  def full_name
    "#{@director} - #{@title} (#{@premiere_year})"
  end
end
