require './lib/dictionary'

class Reverse
  attr_reader :reverse_characters

  def initialize
    @reverse_characters = Dictionary.new.characters.invert
  end

  def translate(message)
    result = message.map do |letter|
      @reverse_characters[letter]
    end
    result.join
  end

end
