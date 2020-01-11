require './lib/key'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'


class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_generates_alph_upon_initialize
    assert_equal 27, @key.alphabet.length
  end

  def test_it_can_generate_random_5_digit_number
    assert_equal 5, @key.random_number.to_s.split('').length

    @key.stubs(:random_number).returns(12345)

    assert_equal 12345, @key.random_number
  end

end
