#!/usr/bin/env ruby

require_relative 'lib/film'
require_relative 'lib/film_selector'

puts "Which director's film would you like to see today?\n"

film_selector = FilmSelector.new("data")

puts "And tonight, I recommend watching: '#{film_selector.get_film_by_director}'"
