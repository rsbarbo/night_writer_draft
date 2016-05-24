require 'pry'
require './lib/alphabet_key'
require './lib/file_reader'

class NightReader
  attr_reader :reader, :alpha

  def transprep_brl_eng
 # =begin
 #
 #     STEP #1
 #
 #     grab all the elements on line_1, line_2, line_3, and shove in into a new empty
 #     array, example
 #     (line_1 []) << ..0.0.0.0.0......00.0.0.00..
 #     (line_2 []) << ..00.00.0..0....00.0000..000
 #     (line_3 []) << .0....0.0.0....0.00.0.0...0.
 #
 #     After input has been shoved into an array, need to split it into strings
 #     example: ["..","0.","0.","0.","0.","0.","..","..",".0","0.","0.","0.","00",".."]
 #
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

end
