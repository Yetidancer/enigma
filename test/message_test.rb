require './lib/key'
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



end
