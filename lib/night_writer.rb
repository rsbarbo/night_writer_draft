require 'pry'
require './lib/alphabet_key'

class FileReader
  def read
    filename = ARGV[0]
    File.read(filename).chomp
  end
end

class NightWriter
  attr_reader :reader, :alpha

  def initialize
    @reader = FileReader.new
    @alpha = Alphabet.new
  end

  def encode_file_to_braille
    # dont worry about testing this method until you are done(instruction)
    plain = reader.read
    # braille = encode_to_braille(plain)
  end

  def encode_to_braille(input)
    braille_array = check_input_vs_alphabet(input.split(''))
    updated_array = sorting_message_per_line(braille_array)
    even_more = lkdjaslkdjsaldjsalkdja(updated_array)
  end

  #convert a string into an array|iterate each element|check each element|
  #build new array with braille conversion
  def check_input_vs_alphabet(string_array)
    braille = []
    string_array.each do |letter|
      if letter == letter.upcase && letter != letter.downcase
        braille << alpha.alphabet[:shift]
        braille << alpha.alphabet[letter.downcase]
      else
        braille << alpha.alphabet[letter]
      end
    end
    braille
  end

  #take the braille returned in a array, and I want to break it down per
  #element
  def sorting_message_per_line(new_array)
    new_array
  end

  # def braille_to_string(bts)
  #   braille.join(",")
  # end

end


# nightwriter = NightWriter.new
# nightwriter.encode_file_to_braille


#maybe shove in the 3 arrays 0,1,2 - into one new array and join('\n') to break the lines into 3 separed lines.

# [1] pry(main)> a = ["asdfasdfsfsdfs"]
# => ["asdfasdfsfsdfs"]
# [2] pry(main)> b = ["sdfdsfsdfsdfd"]
# => ["sdfdsfsdfsdfd"]
# [3] pry(main)> c = []
# => []
# [4] pry(main)> c << a
# => [["asdfasdfsfsdfs"]]
# [5] pry(main)> c << b
# => [["asdfasdfsfsdfs"], ["sdfdsfsdfsdfd"]]
# [6] pry(main)> c.join("\n")
# => "asdfasdfsfsdfs\nsdfdsfsdfsdfd"
# [7] pry(main)> p c.join("\n")
# "asdfasdfsfsdfs\nsdfdsfsdfsdfd"
# => "asdfasdfsfsdfs\nsdfdsfsdfsdfd"
# [8] pry(main)> puts c.join("\n")
# asdfasdfsfsdfs
# sdfdsfsdfsdfd
# => nil
