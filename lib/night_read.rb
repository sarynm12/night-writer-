
#require_relative 'message_writer'
require_relative 'dictionary'

class NightRead
  attr_reader :dictionary, :incoming_message

  def initialize(incoming_message)
    @incoming_message = incoming_message
    @dictionary = Dictionary.new
  end

  def split_message
    @incoming_message.split('')
  end

  def lower_case_letters
    letters = split_message.map do |letter|
      letter.downcase
    end
  end

  def translate_to_braille(incoming_message)
    braille_characters =
      incoming_message.map do |letter|
      @dictionary.characters[letter]
    end
  end

  def first_row
    first_row = ''
    translate_to_braille.each do |element|
      first_row << element[0]
    end
    first_row
  end

  def second_row
    second_row = ''
    translate_to_braille.each do |element|
      second_row << element[1]
    end
    second_row
  end

  def third_row
    third_row = ''
    translate_to_braille.each do |element|
      third_row << element[2]
    end
    third_row
  end

  def braille_output
    puts "#{first_row.slice!(0..79) << "\n"}\n#{second_row.slice!(0..79) << "\n"}\n#{third_row.slice!(0..79) << "\n"}"
  end

end
