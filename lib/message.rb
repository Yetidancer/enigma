class Message

  attr_reader :text
  def initialize(text)
    @text = text
  end

  def separate_text
    @text.split''
  end

end
