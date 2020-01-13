require './lib/key'
require './lib/message'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'


class MessageTest < Minitest::Test

  def setup
    @message = Message.new("hello world")
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_it_has_text
    assert_equal "hello world", @message.text
  end
end
