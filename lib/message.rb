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

  # def shift_text_array_specific(key,text_array,shift_number,shifted_array)
  #   text_array.each do |letter|
  #     new_index = ((key.alphabet.index(letter) + shift_number) % 27)
  #     shifted_array << key.alphabet[new_index]
  #   end
  # end

  # def reverse_shift_text_array_specific(key,text_array,shift_number,shifted_array)
  #   text_array.each do |letter|
  #     new_index = ((key.alphabet.index(letter) - (shift_number % 27)) % 27)
  #     if new_index < 0
  #       new_index += 27
  #     end
  #     shifted_array << key.alphabet[new_index]
  #   end
  # end

  # def shift_text_array(key)
  #   shift_text_array_specific(key, @a_array, key.a_shift, @a_shifted)
  #   shift_text_array_specific(key, @b_array, key.b_shift, @b_shifted)
  #   shift_text_array_specific(key, @c_array, key.c_shift, @c_shifted)
  #   shift_text_array_specific(key, @d_array, key.d_shift, @d_shifted)
  # end

  def reverse_shift_text_array(key)
    reverse_shift_text_array_specific(key, @a_array, key.a_shift, @a_shifted)
    reverse_shift_text_array_specific(key, @b_array, key.b_shift, @b_shifted)
    reverse_shift_text_array_specific(key, @c_array, key.c_shift, @c_shifted)
    reverse_shift_text_array_specific(key, @d_array, key.d_shift, @d_shifted)
  end

  def reform_shifted_text(key)
    @shifted_text = make_shifted_array(key).join
  end

  def make_shifted_array(key)
    shift_text_array(key)
    counter = 0
    @a_shifted.reduce([]) {|shifted_array, letter| shifted_array << letter
      shifted_array << @b_shifted[counter]
      shifted_array << @c_shifted[counter]
      shifted_array << @d_shifted[counter]
      counter += 1
      shifted_array}
  end

  def translate_message(key)
    text_to_array
    reform_shifted_text(key)
  end
end
