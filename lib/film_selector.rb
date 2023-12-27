#!/usr/bin/env ruby

require_relative 'film_helper'

class FilmSelector
  include FilmHelper

  def initialize(folder_name)
    @director_with_films = read_from_file(folder_name)
  end

  def get_film_by_director
    print_directors(@director_with_films)

    user_choiсe = STDIN.gets.to_i

    get_random_film(user_choiсe)
  end

  private

  def print_directors(films)
    directors = get_all_directors(films)

    directors.each.with_index(1) do |director, index|
      puts "#{index}. #{director}"
    end
  end

  def get_all_directors(films)
    @all_director ||= films.map(&:director).uniq
  end

  def get_random_film(user_choiсe)
    selected_director = @director_with_films[user_choiсe - 1]
    return unless selected_director&.variants_film&.any?

    selected_director.variants_film.sample
  end
end
