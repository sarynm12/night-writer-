require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille'

class BrailleTest < Minitest::Test

  def test_it_exists
    braille = Braille.new
    assert_instance_of Braille, braille
  end

end
