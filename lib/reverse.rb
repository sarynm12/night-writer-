require './lib/dictionary'

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
    array = translate
    number = (array.length / 3)
    array.scan(/.{1,#{number}}/)
  end

  def top
    out_top = []
    out_top << split.fetch(0).scan(/../)
    return out_top.flatten
  end

  def mid
    out_mid = []
    out_mid << split.fetch(1).scan(/../)
    return out_mid.flatten
  end

  def bottom
    out_bottom = []
    out_bottom << split.fetch(2).scan(/../)
    return out_bottom.flatten
  end

  def zip_characters_together
    top.zip(mid, bottom)
  end

  def convert_to_english
    zip_characters_together.map do |letter|
      @english_alphabet[letter]
    end
  end

  def english_result
    result = convert_to_english
  end

end
