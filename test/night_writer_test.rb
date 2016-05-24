require_relative '../lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class NightWriterTest < Minitest::Test

  def setup
    @file = NightWriter.new
  end

  def test_convert_one_letter_to_braille
    assert_equal "0.\n00\n..", @file.encode_to_braille("h")
  end

  def test_convert_two_letters_to_braille
    assert_equal "0.0.\n00.0\n....", @file.encode_to_braille("he")
  end

  def test_convert_one_capital_letter
    assert_equal "..0.\n..00\n.0..", @file.encode_to_braille("H")
  end

  def test_convert_two_capital_letters_to_braille
    assert_equal "..0...0.\n..00...0\n.0...0..", @file.encode_to_braille("HE")
  end

  def test_for_single_special_characters_and_or_symbol
    assert_equal "..\n00\n0.", @file.encode_to_braille("!")
  end

  def test_for_double_special_characters_and_or_symbol
    assert_equal "....\n000\n0.00", @file.encode_to_braille("!?")
  end

  def test_for_space_in_the_input
    assert_equal "..\n..\n..", @file.encode_to_braille(" ")
  end

end
