#!/usr/bin/env ruby

module FilmHelper
  def read_from_file(folder_name)
    films = []

    file_pattern = File.expand_path("../#{folder_name}/films.xml", __dir__)
    file_name = Dir.glob(file_pattern).first

    file = File.new(file_name, 'r:UTF-8')

    begin
      doc = REXML::Document.new(file)
    rescue REXML::ParseException => e
      puts "XML file is not valid"
      puts e.message
      exit
    end

    file.close

    doc.elements.each("films/film") do |item|
      director = item.elements['director'].text
      variants = []

      item.elements['variants_film'].elements.each do |variant|
        variants.push(variant.text)
      end

      films << Film.new(director, variants)
    end

    films
  end
end
