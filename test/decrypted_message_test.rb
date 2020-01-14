require './lib/key'
require './lib/message'
require './lib/decrypted_message'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'


class DecryptedMessageTest < Minitest::Test

  def setup
    @key = Key.new("12345","121212")
    @reverse_message = Message.new("ajwghegjkqo")
  end

  def test_reverse_shift_text_array_specific_works
    @reverse_message.text_to_array
    @key.letter_shift
    @reverse_message.reverse_shift_text_array_specific(@key,["j","e","q"],@key.b_shift,@reverse_message.b_shifted)

    assert_equal ["e"," ","l"], @reverse_message.b_shifted
  end

  def test_it_can_reverse_shift_all_text_arrays_simultaneously
    @reverse_message.text_to_array
    @key.letter_shift
    @reverse_message.reverse_shift_text_array(@key)

    assert_equal ["h","o","r"], @reverse_message.a_shifted
    assert_equal ["e"," ","l"], @reverse_message.b_shifted
    assert_equal ["l","w","d"], @reverse_message.c_shifted
    assert_equal ["l","o"], @reverse_message.d_shifted
  end
end
