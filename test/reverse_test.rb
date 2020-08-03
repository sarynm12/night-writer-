require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require 'mocha/minitest'
require './lib/dictionary'
require './lib/reverse'

class ReverseTest < Minitest::Test

  def test_it_exists
    characters = "0.0.0.0.0..00.0.0.00\n00.00.0..000.0000..0\n....0.0.0..00.0.0...\n"
    reverse = Reverse.new(characters)
    assert_instance_of Reverse, reverse
  end

  def test_it_can_translate_hardcoded_arrays
    characters = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
    reverse = Reverse.new(characters)
    assert_equal "hello", reverse.translate
  end

  def test_it_can_split_into_one_array
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    expected = ["0.0.0.0.0..00.0.0.00", "00.00.0..000.0000..0", "....0.0.0..00.0.0..."]
    assert_equal expected, reverse.split
    assert_equal Array, reverse.split.class
  end

  def test_it_can_get_message_length
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    assert_equal 60, reverse.string_length
  end

  def test_it_can_chunk
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    expected = ["0.0.0.0.0..00.0.0.00", "00.00.0..000.0000..0", "....0.0.0..00.0.0..."]
    assert_equal expected, reverse.chunk(message)
  end

  def test_it_can_split_into_rows
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    expected1 = ["0.", "0.", "0.", "0.", "0.", ".0", "0.", "0.", "0.", "00"]
    assert_equal expected1, reverse.first_row
    expected2 = ["00", ".0", "0.", "0.", ".0", "00", ".0", "00", "0.", ".0"]
    assert_equal expected2, reverse.second_row
    expected3 = ["..", "..", "0.", "0.", "0.", ".0", "0.", "0.", "0.", ".."]
    assert_equal expected3, reverse.third_row
  end

  def test_it_can_zip
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."], [".0", "00", ".0"], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."]]
    assert_equal expected, reverse.zip_rows
  end

end
