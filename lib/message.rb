class Message

  attr_reader :text, :a_array, :b_array, :c_array, :d_array, :a_shifted, :b_shifted, :c_shifted, :d_shifted, :shifted_text
  def initialize(text)
    @text = text
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
    @a_shifted = []
    @b_shifted = []
    @c_shifted = []
    @d_shifted = []
    @shifted_text = nil
  end

  def separate_text
    @text.split''
  end

  def text_to_array_specific(position,text_array)
    counter = position
    separate_text.each do |letter|
      text_array << letter if (counter % 4 == 0)
      counter += 1
    end
  end

  def text_to_array
    text_to_array_specific(0,@a_array)
    text_to_array_specific(-1,@b_array)
    text_to_array_specific(-2,@c_array)
    text_to_array_specific(-3,@d_array)
  end

  def shift_text_array_specific(key,text_array,shift_number,shifted_array)
    text_array.each do |letter|
      new_index = ((key.alphabet.index(letter) + shift_number) % 27)
      shifted_array << key.alphabet[new_index]
    end
  end

end
