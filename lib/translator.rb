require_relative 'dictionary'

class Translator
  attr_reader :dictionary, :incoming_message

  def initialize(incoming_message)
    @incoming_message = incoming_message
    @dictionary = Dictionary.new
  end

  def split_message
    @incoming_message.chars
  end

  def create_braille_groups
    one = split_message[0].scan(/../)
    two = split_message[1].scan(/../)
    three = split_message[2].scan(/../)
    letters = one.zip(two, three)
    translate_to_braille
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
  end

  def braille_output
    array = transpose
    if @incoming_message.length > 40
      one = array[0].slice!(0..79).join("\n")
      two = array[1].slice!(0..79).join("\n")
      three = array[2].slice!(0..79).join("\n")
    else
      one = array[0].join("")
      two = array[1].join("")
      three = array[2].join("")
    end
    result = "#{one}\n#{two}\n#{three}\n"
  end

end
