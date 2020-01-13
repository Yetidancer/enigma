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

  def test_it_can_populate_abcd_text_arrays
    @message.separate_text
  end
end
