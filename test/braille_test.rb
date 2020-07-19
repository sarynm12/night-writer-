require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille'

class BrailleTest < Minitest::Test

  def test_it_exists
    braille = Braille.new
    assert_instance_of Braille, braille
  end

  def test_it_can_translate
    braille = Braille.new
    assert_equal [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]], braille.translate("hello")
  end

end
