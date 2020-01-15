require_relative 'test_helper'
require './lib/key'
require './lib/message'
require './lib/encrypted_message'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class EncryptedMessageTest < Minitest::Test

  def setup
    @key = Key.new("12345","121212")
    @message = EncryptedMessage.new("hello world")
  end

  def test_it_can_apply_shift_to_text_arrays
    @message.text_to_array
    @key.letter_shift
    @message.shift_text_array_specific(@key,@message.b_array,@key.b_shift,@message.b_shifted)

    assert_equal ["j","e","q"], @message.b_shifted
  end

  def test_it_can_apply_shift_to_text_arrays
    @message.text_to_array
    @key.letter_shift
    @message.shift_text_array_specific(@key,["e"," ","!"],@key.b_shift,@message.b_shifted)

    assert_equal ["j","e","!"], @message.b_shifted
  end
end
