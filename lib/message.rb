class Message

  attr_reader :text, :a_array, :b_array, :c_array, :d_array
  def initialize(text)
    @text = text
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
  end

  def separate_text
    @text.split''
  end

  def text_to_a_array
    counter = 0
    separate_text.each do |letter|
      @a_array << letter if (counter % 4 == 0)
      counter += 1
    end
  end

  def text_to_array_specific(position,array)
    counter = position
    separate_text.each do |letter|
      array << letter if (counter % 4 == 0)
      counter += 1
    end
  end

  def text_to_array
    text_to_array_specific(0,@a_array)
    text_to_array_specific(-1,@b_array)
    text_to_array_specific(-2,@c_array)
    text_to_array_specific(-3,@d_array)
  end
end
