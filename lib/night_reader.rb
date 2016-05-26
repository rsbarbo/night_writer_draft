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
    english_array = shrink_lines(braille)
    braille_array = sorting_out(english_array)
    @braille_alphabet = alphabet.trans_braille.invert
    final_translation(braille_array).join
  end

  def shrink_lines(braille)
    current_val = 0
    other_val = 3
    new_array = []
    new_array = braille.split("\n")
    @braille_message = []
    until new_array.count == 3
      new_array[current_val] += new_array[other_val]
      new_array.delete_at(other_val)
      if current_val == 2
        current_val = 0
      else
        current_val += 1
      end
    end
    @braille_message = new_array
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
    check_shift(trans_outcome)
  end

  def check_shift(trans_outcome)
    sft_catcher = trans_outcome.map do |letter|
      letter.to_s
    end
    sft_catcher.each.with_index do |letter, index|
      if letter == "shift"
        sft_catcher[index] =  sft_catcher[index + 1].upcase
        sft_catcher[index + 1] = nil
      end
    end
  end

end
