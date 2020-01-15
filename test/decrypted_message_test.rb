require_relative 'test_helper'
require './lib/key'
require './lib/message'
require './lib/decrypted_message'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class DecryptedMessageTest < Minitest::Test

  def setup
    @key = Key.new("12345","121212")
    @reverse_message = DecryptedMessage.new("ajwghegjkqo")
  end

  def test_reverse_shift_text_array_specific_works
    @reverse_message.text_to_array
    @key.letter_shift
    @reverse_message.shift_text_array_specific(@key,["j","e","q"],@key.b_shift,@reverse_message.b_shifted)

    assert_equal ["e"," ","l"], @reverse_message.b_shifted
  end

  def test_reverse_shift_text_array_specific_works_with_negative_shift_and_symbols
    @reverse_message.text_to_array
    @key.letter_shift
    @reverse_message.shift_text_array_specific(@key,["d","e","!"],@key.b_shift,@reverse_message.b_shifted)

    assert_equal ["z"," ","!"], @reverse_message.b_shifted
  end
end
