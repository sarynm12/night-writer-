class EnglishTranslator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new
  end

end
