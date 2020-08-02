require_relative 'dictionary'

class NightRead
  attr_reader :dictionary, :incoming_message
  #attr_accessor :outgoing_text

  def initialize(incoming_message)
    @incoming_message = incoming_message
    @dictionary = Dictionary.new
    #@outgoing_text = ''
  end

  def split_message
    @incoming_message.chars
  end

  def create_braille_groups
    letter_1 = split_message[0].scan(/../)
    letter_2 = split_message[1].scan(/../)
    letter_3 = split_message[2].scan(/../)
    letters = letter_1.zip(letter_2, letter_3)
    translate_to_braille
  end

  def braille
    translate_to_braille
    braille_output
  end

  def translate_to_braille
    split_message
    braille_characters =
      split_message.map do |letter|
      @dictionary.characters[letter]
    end
    braille_characters
  end

  def transpose
    create_braille_groups.compact.transpose
    #translate_to_braille.transpose
  end

  def braille_output
    # "#{first_row.slice!(0..79) << "\n"}#{second_row.slice!(0..79) << "\n"}#{third_row.slice!(0..79) << "\n"}"

    a = transpose
    one = a[0].slice!(0..79).join("")
    two = a[1].slice!(0..79).join("")
    three = a[2].slice!(0..79).join("")
    #result = one + "\n" + two + "\n" + three
    result = "#{one}\n#{two}\n#{three}\n"
  end

  def eighty_characters
    # a = []
    # one = first_row
    # two = second_row
    # three = third_row
    a = translate_to_braille
    one = a[0]
    two = a[1]
    three = a[2]
    result = []
    until one.length == 0
      result << one.slice!(0..79) + "\n"
      result << two.slice!(0..79) + "\n"
      result << three.slice!(0..79) + "\n"
    end
    result.join
  end

end
