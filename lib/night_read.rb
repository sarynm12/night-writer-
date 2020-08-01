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

  # def lower_case_letters
  #   letters = split_message.map do |letter|
  #     letter.downcase
  #   end
  # end

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



# def format_braille_output(translated_array)
#   transposed_array = translated_array.transpose
#   chunked_for_print = []
#   until transposed_array.flatten.count == 0 do
#     chunked_for_print << transposed_array[0].slice!(0..39).join
#     chunked_for_print << "\n"
#     chunked_for_print << transposed_array[1].slice!(0..39).join
#     chunked_for_print << "\n"
#     chunked_for_print << transposed_array[2].slice!(0..39).join
#     chunked_for_print << "\n\n"
#   end
#   chunked_for_print.join
# end






# def rows
#   @top_row = ""
#   @mid_row = ""
#   @bot_row = ""
# end
#
# def english_to_braille(message)
#   rows
#   message.chars.map do |character|
#     character
#
#     @top_row << braillealphabet[character.downcase].split("\n")[0]
#     @mid_row << braillealphabet[character.downcase].split("\n")[1]
#     @bot_row << braillealphabet[character.downcase].split("\n")[2]
# end
#
#     [@top_row, @mid_row, @bot_row].join("\n")
#
# end
#
# def braille_to_english(message)
#     braille_to_english = ""
#    split = message.split("\n")
#   until split == ["","",""]
#     rows
#
#     @top_row << split[0].slice!(0,2)
#     @mid_row << split[1].slice!(0,2)
#     @bot_row << split[2].slice!(0,2)
#
#   end
# end
