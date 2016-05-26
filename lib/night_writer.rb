require 'pry'
require './lib/alphabet_key'
require './lib/file_reader'

class NightWriter
attr_reader :reader, :alpha

  def initialize
    @reader = FileReader.new
    @alpha = Alphabet.new
  end

  def encode_file_to_braille
    plain = reader.read
    encode_to_braille(plain)
  end

  def encode_to_braille(input)
    result = []
    input.split('').each_slice(40) do |one_sixty_dots|
      result << check_input_vs_alphabet(one_sixty_dots)
    end
    result.join
  end

  def check_input_vs_alphabet(string_array)
    braille_translated = []
    string_array.each do |letter|
      if letter == letter.upcase && letter != letter.downcase
        braille_translated << alpha.trans_braille[:shift]
        braille_translated << alpha.trans_braille[letter.downcase]
      else
        braille_translated << alpha.trans_braille[letter]
      end
    end
    sort_out(braille_translated)
  end

  def sort_out(braille_translated)
  line_1 = []
  line_2 = []
  line_3 = []

    braille_translated.each do |letter|
      line_1 << letter[0]
      line_2 << letter[1]
      line_3 << letter[2]
    end
    "#{line_1.join}\n#{line_2.join}\n#{line_3.join}\n"
  end

end
