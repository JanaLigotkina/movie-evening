#!/usr/bin/env ruby

require "rexml/document"

class Film
	attr_reader :director, :variants_film

	def initialize(director, variants_film)
		@director = director
		@variants_film = variants_film
	end
end 
