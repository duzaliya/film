require_relative 'lib/film_collection'

puts "Фильм на вечер"
puts

begin
  film_collection = FilmCollection.from_list
rescue SocketError
  puts "Упс, проблемы с сетью. Предлагаем фильмы из личной коллекции."
  file_names = Dir[File.join(__dir__, "data", "*")]
  film_collection = FilmCollection.read_from_txt(file_names)
end

puts "Фильм какого режиссера вы хотите сегодня посмотреть?"

puts film_collection.show_directors

input = gets.to_i

puts "Сегодня вечером рекомендую посмотреть:"
puts film_collection.select_film(input)
