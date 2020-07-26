require 'minitest/autorun'
require 'minitest/pride'
require './lib/dictionary'
require './lib/english_translator'

class EnglishToBrailleTest < Minitest::Test

  def test_it_exists
    translator = EnglishTranslator.new
    assert_instance_of EnglishTranslator, translator
  end

end
