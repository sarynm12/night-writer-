require_relative 'dictionary'

class Reverse
  attr_reader :reverse_characters, :message

  def initialize(message)
    @message = message
    @reverse_characters = Dictionary.new.characters.invert
  end

  def translate
    result = message.map do |letter|
      @reverse_characters[letter]
    end
    result.join
  end

  def split
    array = self.message.split("\n")
    one = array[0].scan(/../)
    two = array[1].scan(/../)
    three = array[2].scan(/../)
    chars = one.zip(two, three)
  end

  def braille_to_english
    chars = split
    result = chars.map do |char|
      @reverse_characters[char]
    end
    result.join
  end



end
