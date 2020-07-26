class MessageReader
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def read
    File.read(@message)
  end

end
