require 'pry'
require './lib/alphabet_key'
require './lib/file_reader'

class NightReader
attr_reader :reader, :alphabet

  def initialize
    @reader = FileReader.new
    @alphabet = Alphabet.new
  end

  def encode_to_english(braille)
    english_array = split_braille_into_three_indexes(braille)
    braille_array = sorting_out(english_array)
    @braille_alphabet = alphabet.trans_braille.invert
    final_translation(braille_array).join
  end

  def split_braille_into_three_indexes(braille)
    current_val = 0
    other_val = 3
    temp_array = []
    temp_array = braille.split("\n")
    @braille_message = []
    until temp_array.count == 3
      temp_array[current_val] += temp_array[other_val]
      temp_array.delete_at(other_val)
      if current_val == 2
        current_val = 0
      else
        current_val += 1
      end
    end
    @braille_message = temp_array
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

  def final_translation(braille_array)
    trans_outcome = braille_array.map do |braille_char|
      @braille_alphabet[braille_char]
    end
    check_num_shift(trans_outcome)
  end

  def check_num_shift(trans_outcome)
    a = trans_outcome.map do |letter|
      letter.to_s
    end
    a.each.with_index do |letter, index|
      if letter == "shift"
        a[index] =  a[index + 1].upcase
        a[index + 1] = nil
      end
    end
  end

end
