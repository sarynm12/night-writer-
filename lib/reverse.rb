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

  def string_length
    length = @message.length
  end

  def string_divided
    return (string_length / 3)
  end

  def chunk(message, size = (self.string_divided))
    result = @message.scan(/.{1,#{size}}/)
  end

  def split
    self.chunk(message, size = (self.string_divided))
  end

  def first_row
    array = split
    array[0].scan(/../)
  end

  def second_row
    array = split
    array[1].scan(/../)
  end

  def third_row
    array = split
    array[2].scan(/../)
  end

  def zip_rows
    first_row.zip(second_row, third_row)
  end

  def braille_to_english
    chars = zip_rows
    result = chars.map do |char|
      @reverse_characters[char]
    end
    result.join
  end

end
