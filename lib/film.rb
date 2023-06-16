class Film
	attr_reader :name, :director, :show_year

	def initialize(name, director, show_year)
		@name = name
		@director = director
		@show_year = show_year
	end 	

	def full_name_film
		return "#{@director} - #{@name} (#{@show_year})"
	end	
end 