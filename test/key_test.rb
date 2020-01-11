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

  def test_it_has_abcd_var_upon_initialize
    assert_equal 0, @key.a_shift
    assert_equal 0, @key.b_shift
    assert_equal 0, @key.c_shift
    assert_equal 0, @key.d_shift
  end

  def test_it_can_produce_date_shift_array
    @key.stubs(:date).returns("121212")

    assert_equal ["8","9","4","4"], @key.date_shift(@key.date)
  end

  def test_it_can_calculate_letter_shift_a
    @key.stubs(:random_array).returns([1,2,3,4,5])
    @key.stubs(:date).returns("121212")
    @key.letter_shift_a
    assert_equal 20, @key.a_shift
  end

  def test_it_can_calculate_letter_shift_b
    @key.stubs(:random_array).returns([1,2,3,4,5])
    @key.stubs(:date).returns("121212")
    @key.letter_shift_b
    assert_equal 32, @key.b_shift
  end

  def test_it_can_calculate_letter_shift_c
    @key.stubs(:random_array).returns([1,2,3,4,5])
    @key.stubs(:date).returns("121212")
    @key.letter_shift_c
    assert_equal 38, @key.c_shift
  end

  def test_it_can_calculate_letter_shift_d
    @key.stubs(:random_array).returns([1,2,3,4,5])
    @key.stubs(:date).returns("121212")
    @key.letter_shift_d
    assert_equal 49, @key.d_shift
  end



end
