require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require 'mocha/minitest'
require './lib/dictionary'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def test_it_exists
    translator = Translator.new("hello")
    assert_instance_of Translator, translator
  end

  def test_it_has_an_incoming_message
    translator = Translator.new("hello")
    assert_equal "hello", translator.incoming_message
  end

  def test_it_can_count_dictionary_key_value_pairs
    translator = Translator.new("hello")
    assert_equal 30, translator.dictionary.characters.count
  end

  def test_it_can_split_incoming_message
    translator = Translator.new("hello")
    assert_equal ["h", "e", "l", "l", "o"], translator.split_message
  end

  def test_it_can_translate
    translator = Translator.new("hello")
    translator.split_message
    assert_equal [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]], translator.translate_to_braille
  end

  def test_it_converts_appropriate_characters_to_first_row
    translator = Translator.new("hello world")
    translator.split_message
    translator.translate_to_braille
    assert_equal ["0.", "00", ".."], translator.translate_to_braille[0]
  end

  def test_it_converts_appropriate_characters_to_second_row
    translator = Translator.new("hello world")
    translator.split_message
    translator.translate_to_braille
    assert_equal ["0.", "00", ".."], translator.translate_to_braille[0]
    assert_equal ["0.", ".0", ".."], translator.translate_to_braille[1]
  end

  def test_it_converts_appropriate_characters_to_third_row
    translator = Translator.new("hello world")
    translator.split_message
    translator.translate_to_braille
    assert_equal ["0.", "00", ".."], translator.translate_to_braille[0]
    assert_equal ["0.", ".0", ".."], translator.translate_to_braille[1]
    assert_equal ["0.", "0.", "0."], translator.translate_to_braille[2]
  end

  def test_it_can_create_braille_groups
    translator = Translator.new("hello world")
    translator.split_message
    expected = [["0.", "00", ".."],
               ["0.", ".0", ".."],
               ["0.", "0.", "0."],
               ["0.", "0.", "0."],
               ["0.", ".0", "0."],
               nil,
               [".0", "00", ".0"],
               ["0.", ".0", "0."],
               ["0.", "00", "0."],
               ["0.", "0.", "0."],
               ["00", ".0", ".."]]
    assert_equal expected, translator.create_braille_groups
  end

  def test_it_can_compact_and_transpose
    translator = Translator.new("hello world")
    translator.split_message
    translator.create_braille_groups
    expected = [["0.", "0.", "0.", "0.", "0.", ".0", "0.", "0.", "0.", "00"], ["00", ".0", "0.", "0.", ".0", "00", ".0", "00", "0.", ".0"], ["..", "..", "0.", "0.", "0.", ".0", "0.", "0.", "0.", ".."]]
    assert_equal expected, translator.transpose
  end

  def test_it_has_three_lines_after_transposing
    translator = Translator.new("hello world")
    translator.split_message
    translator.create_braille_groups
    assert_equal 3, translator.transpose.count
  end

  def test_it_can_return_a_full_braille_output
    translator = Translator.new("hello world")
    translator.split_message
    translator.translate_to_braille
    expected = "0.0.0.0.0..00.0.0.00\n00.00.0..000.0000..0\n....0.0.0..00.0.0...\n"
    assert_equal expected, translator.braille_output
  end

  def test_eighty_lines
    translator = Translator.new("abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcd")
    translator.split_message
    translator.translate_to_braille
    assert_equal [], translator.braille_output
  end

end
