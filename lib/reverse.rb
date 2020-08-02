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
    array = self.message
    one = array[0].join.scan(/../)
    two = array[1].join.scan(/../)
    three = array[2].join.scan(/../)
    chars = one.zip(two, three)
    chars.transpose
  end

  def braille_work
    characters = split
    first = []
    second = []
    characters.each do |character|
      second << characters[0][0..1]
      characters[0].slice!(0..1)
      second << characters[1][0..1]
      characters[1].slice!(0..1)
      second << characters[2][0..1]
      characters[2].slice!(0..1)

      first << second.join
    end
    first.join
  end

  # def convert_to_english
  #   zip_characters_together.map do |letter|
  #     @english_alphabet[letter]
  #   end
  # end



end
