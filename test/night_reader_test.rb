require_relative '../lib/night_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class NightReaderTest < Minitest::Test

  def setup
    @file = NightReader.new
  end

  def test_convert_one_braille_to_english
    skip
    assert_equal "h", @file.encode_to_english("0.\n00\n..")
  end

  def test_convert_two_letters_to_braille
    assert_equal "he", @file.encode_to_english("0.0.\n00.0\n....")
  end

  def test_convert_one_capital_letter
    skip
    assert_equal "H", @file.encode_to_english("..0.\n..00\n.0..")
  end

  def test_convert_two_capital_letters_to_braille
    skip
    assert_equal "HE", @file.encode_to_english("..0...0.\n..00...0\n.0...0..")
  end

  def test_for_single_special_characters_and_or_symbol
    skip
    assert_equal "!", @file.encode_to_english("..\n00\n0.")
  end

  def test_for_double_special_characters_and_or_symbol
    skip
    assert_equal "!?", @file.encode_to_english("....\n000\n0.00")
  end

  def test_for_space_in_the_input
    skip
    assert_equal " ", @file.encode_to_english("..\n..\n..")
  end

  def test_file_message_exits
    skip
    assert_equal "hello", @file.encode_to_english("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    assert File.exist?("./braille.txt")
  end

end
