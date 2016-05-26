require 'pry'
require_relative "file_reader"
require_relative "night_reader"

  input   = FileReader.read(ARGV[0])
  file    = NightReader.new
  english = file.encode_to_english(input)
            File.write(ARGV[1], english)
