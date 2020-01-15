require_relative 'message'

class DecryptedMessage < Message

  attr_reader :text, :a_array, :b_array, :c_array, :d_array, :a_shifted, :b_shifted, :c_shifted, :d_shifted, :shifted_text
  def initialize(text)
    @text = text.downcase
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
      if key.alphabet.include?(letter)
        new_index = ((key.alphabet.index(letter) - (shift_number % 27)) % 27)
        if new_index < 0
          new_index += 27
        end
        shifted_array << key.alphabet[new_index]
      else
        shifted_array << letter
      end
    end
  end
end
