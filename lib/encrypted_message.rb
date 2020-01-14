require_relative 'message'

class EncryptedMessage < Message

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

  def shift_text_array_specific(key,text_array,shift_number,shifted_array)
    text_array.each do |letter|
      new_index = ((key.alphabet.index(letter) + shift_number) % 27)
      shifted_array << key.alphabet[new_index]
    end
  end
end
