require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require 'mocha/minitest'
require './lib/dictionary'
require './lib/reverse'

class ReverseTest < Minitest::Test

  def test_it_exists
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    assert_instance_of Reverse, reverse
  end

  def test_it_can_count_dictionary_key_value_pairs
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    assert_equal 30, reverse.reverse_characters.count
  end

  def test_it_has_a_message
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    assert_equal "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0...", reverse.message
  end

  def test_it_can_translate_hardcoded_arrays
    characters = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
    reverse = Reverse.new(characters)
    assert_equal "hello", reverse.translate
  end

  def test_it_can_return_length_of_message
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    assert_equal 60, reverse.string_length
  end

  def test_it_can_calculate_number_to_use_in_chunk_method
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    assert_equal 20, reverse.string_divided
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

  def test_it_can_create_a_first_row
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    expected = ["0.", "0.", "0.", "0.", "0.", ".0", "0.", "0.", "0.", "00"]
    assert_equal expected, reverse.first_row
  end

  def test_it_can_create_a_second_row
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    expected = ["00", ".0", "0.", "0.", ".0", "00", ".0", "00", "0.", ".0"]
    assert_equal expected, reverse.second_row
  end

  def test_it_can_create_a_third_row
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    expected = ["..", "..", "0.", "0.", "0.", ".0", "0.", "0.", "0.", ".."]
    assert_equal expected, reverse.third_row
  end

  def test_it_can_zip
    characters = "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0..."
    reverse = Reverse.new(characters)
    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."], [".0", "00", ".0"], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."]]
    assert_equal expected, reverse.zip_rows
  end

end
