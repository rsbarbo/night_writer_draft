require 'pry'
require_relative "file_reader"
require_relative "night_writer"

  input   = FileReader.read(ARGV[0])
  file    = NightWriter.new
  braille = file.encode_to_braille(input)
            File.write(ARGV[1], braille)
