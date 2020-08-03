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
    require "pry"; binding.pry
    chars.transpose
  end

  def braille_work
    characters = split
    first = []
    second = []
      self.message.count.times do |character|
        second << characters[0][0..1]
        characters[0].slice!(0..1)
        second << characters[1][0..1]
        characters[1].slice!(0..1)
        second << characters[2][0..1]
        characters[2].slice!(0..1)

        first << second.join
        require "pry"; binding.pry
    end
    first.join
  end

  def braille_to_english
    result = braille_work.split
    require "pry"; binding.pry
    braille_work.map do |letter|

      @reverse_characters[letter]
    end
  end



end
