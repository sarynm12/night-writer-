require_relative 'dictionary'

class NightRead
  attr_reader :dictionary, :incoming_message, :outgoing_text
  #attr_accessor :outgoing_text

  def initialize(incoming_message)
    @incoming_message = incoming_message
    @dictionary = Dictionary.new
    @outgoing_text = []
  end

  def split_message
    @incoming_message.chars
  end

  def create_braille_groups
    letter_1 = split_message[0].scan(/../)
    letter_2 = split_message[1].scan(/../)
    letter_3 = split_message[2].scan(/../)
    letters = letter_1.zip(letter_2, letter_3)
    translate_to_braille.join
  end

  def translate_to_braille
    split_message
    braille_characters =
      split_message.map do |letter|
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

  def eighty_characters
    one = first_row
    two = second_row
    three = third_row
    until one.length == 0
      @outgoing_text << one.slice!(0..79) + "\n"
      @outgoing_text << two.slice!(0..79) + "\n"
      @outgoing_text << three.slice!(0..79) + "\n"
    end
    @outgoing_text.join
  end

end
