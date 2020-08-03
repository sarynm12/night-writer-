require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/dictionary'

class DictionaryTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new
    assert_instance_of Dictionary, dictionary
  end

  def test_it_can_find_correct_value_when_given_a_key
    dictionary = Dictionary.new
    assert_equal ["0.","..",".."], dictionary.characters["a"]
    assert_equal ["0.", ".0", ".."], dictionary.characters["e"]
  end

  def test_it_knows_count_of_key_value_pairs
    dictionary = Dictionary.new
    assert_equal 30, dictionary.characters.count
  end

  def test_it_can_translate_characters
    dictionary = Dictionary.new
    assert_equal [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]], dictionary.translate("hello")
  end

end
