require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require 'mocha/minitest'
require './lib/dictionary'
require './lib/reverse'

class ReverseTest < Minitest::Test

  def test_it_exists
    reverse = Reverse.new([["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]])
    assert_instance_of Reverse, reverse
  end

  def test_it_can_translate
    reverse = Reverse.new([["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]])
    assert_equal "hello", reverse.translate
  end

  def test_it_can_split_string_of_braille_characters
    reverse = Reverse.new([["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]])
    reverse.translate
    assert_equal ["h", "e", "l", "l", "o"], reverse.split
  end

end
