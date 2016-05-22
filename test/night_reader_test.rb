require "pry"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/alphabet_key"


class ReaderTest < Minitest::Test

def test_translate_to_braille
    translator = Alphabet.new.key
end

end
