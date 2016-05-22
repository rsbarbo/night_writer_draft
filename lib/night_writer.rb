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
    braille = encode_to_braille(plain)
  end

  #This method will call all the additional methods.
  def encode_to_braille(input)
    braille_array = check_input_vs_alphabet(input.split(''))
  end

  #cnvrt strng into array|itrte each elemnt|chck each elemnt|build new array w/ brl cnvrt
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
    braille_translated
  end

end

puts
