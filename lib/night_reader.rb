require 'pry'
require './lib/alphabet_key'
require './lib/file_reader'

class NightReader

  attr_reader :reader, :alpha

  def initialize
    @reader = FileReader.new
    @alpha = Alphabet.new
  end

  def encode_to_english(input)
    english_array = input.split("\n")
    braille_array = sorting_out(english_array)
    braille_map = alpha.trans_braille.invert
    braille_array.map do |braille_char|
      braille_map[braille_char]

    end
  end

  def sorting_out(english_array)
    transformation = english_array.map do |line|
      pair_qty = line.length/2
      pair_qty.times.map do |i|
        line[(i*2)..(i*2+1)]
      end
    end
    transformation[0].zip(transformation[1], transformation[2])
  end
end



#
#
#
#
#     we have english_array
#     to grab the first braille char
#       char = []
#       char << english_array[0][0..1]
#       char << english_array[1][0..1]
#       char << english_array[2][0..1]
#       char
#
# "0. 0. 0. .."
# i 0
#   0  i * 2
#   1  i * 2 + 1
# i 1
#   2 i * 2
#   3 i * 2 +1
# i 2
#   4 i * 2
#   5 i * 2 + 1
# i 3
#   6 i * 2
#   7 i * 2 +1
#
#
#     line_1 = []
#     line_2 = []
#     line_3 = []
#       line_1 << english_array[0]
#       line_2 << english_array[1]
#       line_3 << english_array[2]
#       combined = []
#       combined << line_1
#       combined << line_2
#       combined << line_3
#       binding.pry
#
# end



 #
 # # =begin
 # #
 # #     STEP #1
 # #
 # #     grab all the elements on line_1, line_2, line_3, and shove in into a new empty
 # #     array, example
 #     (line_1 []) << ..0.0.0.0.0......00.0.0.00..
 #     (line_2 []) << ..00.00.0..0....00.0000..000
 #     (line_3 []) << .0....0.0.0....0.00.0.0...0.
 # # #
 #     STEP #2
 #
 #     Create an empty array with a variable name "prep_to_trans" = [])
 #
 #     prep_to_trans = []
 #     prep_to_trans << [[line_1], [line_2], [line_3]]
 #
 #     STEP #3
 #
 #     sort_out(english_translated)
 #
 #     need to sort out line_1[0], line_2[0], line_3[0] into an empty array
 #     and so on for all the remainder strings(letters)
 #
 # =end
 #
