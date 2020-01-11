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
    @key.create_random_number

    assert_equal 5, @key.random_array.length

    @key.stubs(:random_array).returns([1,2,3,4,5])

    assert_equal [1,2,3,4,5], @key.random_array
  end

  def test_it_can_create_split_random_array_with_consecutive_values
    @key.stubs(:random_array).returns([1,2,3,4,5])

    assert_equal [[1,2],[2,3],[3,4],[4,5]], @key.make_consecutives(@key.random_array)
  end

end
