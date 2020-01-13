require './lib/key'
require './lib/message'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'


class MessageTest < Minitest::Test

  def setup
    @key = Key.new(12345)
    @message = Message.new("hello world")
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_it_has_text
    assert_equal "hello world", @message.text
  end

  def test_it_can_create_split_text_array
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @message.separate_text
  end

  def test_it_can_populate_text_array_a
    @message.text_to_a_array

    assert_equal ["h","o","r"], @message.a_array
  end

  def test_text_to_array_helper_method_populates_text_arrays
    @message.text_to_array(0,@message.a_array)
    # @message.text_to_array(2,@message.c_array)

    assert_equal ["h","o","r"], @message.a_array
    # assert_equal ["l","w","d"], @message.c_array
  end
end
