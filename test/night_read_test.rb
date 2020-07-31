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
    assert_equal [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]], night_read.translate_to_braille("hello")
  end


  def test_it_converts_one_letter_to_the_top_row_of_braille_character
    skip
    night_read = NightRead.new("ab")
    night_read.translate_to_braille("ab")
    assert_equal "0.0.", night_read.first_row
  end


  def test_it_converts_one_letter_to_the_mid_row_of_braille_character
    skip
    night_read = NightRead.new("ab")
    night_read.split_message("ab")
    night_read.translate_to_braille("ab")
    assert_equal "0.0.", night_read.first_row
    assert_equal "..0.", night_read.second_row
  end


  def test_it_converts_one_letter_to_the_bottom_row_of_braille_character
    skip
    night_read = NightRead.new("ab")
    night_read.split_message("ab")
    night_read.translate_to_braille("ab")
    assert_equal "0.0.", night_read.first_row
    assert_equal "..0.", night_read.second_row
    assert_equal "....", night_read.third_row
  end

end
