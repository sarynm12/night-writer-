require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require 'mocha/minitest'
require './lib/dictionary'
require './lib/reverse'

class ReverseTest < Minitest::Test

  def test_it_exists
    characters = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
    reverse = Reverse.new(characters)
    assert_instance_of Reverse, reverse
  end

  def test_it_can_translate
    characters = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
    reverse = Reverse.new(characters)
    assert_equal "hello", reverse.translate
  end

  def test_it_can_split_string_of_braille_characters
    characters = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
    reverse = Reverse.new(characters)
    reverse.translate
    require "pry"; binding.pry
    assert_equal ["h", "e", "l", "l", "o"], result = reverse.split
  end

end
