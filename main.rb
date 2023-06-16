require_relative 'lib/film'

directors_variant = []
choice = []

file_names = Dir[File.join(__dir__, "data", "*.txt")] # массив путей файлов 

# делаем из каждого файла массив строк; 
films = file_names.map do |file_names| 
	lines = File.readlines(file_names, chomp:true)
	Film.new(lines[0], lines[1], lines[2])
end

# массив режиссеров 
films.each_with_index do |item, index|
	directors_variant << films[index].director 
end 

# массив уникальных режиссеров
directors_uniq = directors_variant.uniq


puts 'Программа "Фильм на вечер"'
puts 
directors_uniq.each_with_index do |item, index|
		puts "#{index + 1}. #{item}"
end

puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'
puts
answer = STDIN.gets.to_i

films.each_with_index do |item, index|
	if films[index].director == directors_uniq[answer - 1]
		choice << films[index]
	end	
end 

puts "И сегодня вечером рекомендую посмотреть:"
puts choice.sample.full_name_film	
