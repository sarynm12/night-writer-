require 'minitest/autorun'
require 'minitest/pride'
require './lib/dictionary'
require './lib/night_read'

class NightReadTest < Minitest::Test

  def test_it_exists
    night_read = NightRead.new("hello")
    assert_instance_of NightRead, night_read
  end

  def test_it_can_count_dictionary_key_value_pairs
    night_read = NightRead.new("hello")
    assert_equal 35, night_read.dictionary.characters.count
  end

  def test_it_can_split_incoming_message
    night_read = NightRead.new("hello")
    assert_equal ["h", "e", "l", "l", "o"], night_read.split_message
  end

  def test_it_can_translate
    night_read = NightRead.new("hello")
    night_read.split_message
    assert_equal [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]], night_read.translate_to_braille
  end

  def test_it_converts_appropriate_characters_to_first_row
    night_read = NightRead.new("hello world")
    night_read.split_message
    night_read.translate_to_braille
    assert_equal "0.0.0.0.0....00.0.0.00", night_read.first_row
  end

  def test_it_converts_appropriate_characters_to_second_row
    night_read = NightRead.new("hello world")
    night_read.split_message
    night_read.translate_to_braille
    assert_equal "0.0.0.0.0....00.0.0.00", night_read.first_row
    assert_equal "00.00.0..0..00.0000..0", night_read.second_row
  end

  def test_it_converts_appropriate_characters_to_third_row
    night_read = NightRead.new("hello world")
    night_read.split_message
    night_read.translate_to_braille
    assert_equal "0.0.0.0.0....00.0.0.00", night_read.first_row
    assert_equal "00.00.0..0..00.0000..0", night_read.second_row
    assert_equal "....0.0.0....00.0.0...", night_read.third_row
  end

  def test_it_can_handle_a_longer_message
    night_read = NightRead.new("hello world")
    night_read.split_message
    night_read.translate_to_braille
    night_read.eighty_characters
    require "pry"; binding.pry
  end

end
