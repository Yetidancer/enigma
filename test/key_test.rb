require './lib/key'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'


class KeyTest < Minitest::Test

  def setup
    @key = Key.new("12345","121212")
  end

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_generates_alph_upon_initialize
    assert_equal 27, @key.alphabet.length
  end

  def test_it_can_generate_random_5_digit_number
    assert_equal 5, @key.digits_array.length

    @key.stubs(:digits_array).returns([1,2,3,4,5])

    assert_equal [1,2,3,4,5], @key.digits_array
  end

  def test_it_can_create_split_digits_array_with_consecutive_values
    @key.stubs(:digits_array).returns([1,2,3,4,5])

    assert_equal [[1,2],[2,3],[3,4],[4,5]], @key.make_consecutives(@key.digits_array)
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

  def test_it_can_calculate_letter_shift
    @key.letter_shift

    assert_equal 20, @key.a_shift
    assert_equal 32, @key.b_shift
    assert_equal 38, @key.c_shift
    assert_equal 49, @key.d_shift
  end

  def test_shift_helper_method_works
    @key.digits_array = [1,2,3,4,5]
    @key.date = "121212"

    assert_equal 20, @key.helper_shift(0)
  end

  def test_key_digits_is_0_if_no_value_is_passed_in_at_intitialization
    other_key = Key.new

    assert_equal 0, other_key.key_digits
  end

  def test_key_digits_can_be_translated_into_digits_array
    other_key = Key.new("54321")

    assert_equal [5,4,3,2,1], other_key.digits_array
  end

  def test_it_can_populate_date_upon_initialization_if_none_given
    other_key = Key.new("54321")

    assert_equal "130120", other_key.date
  end
end
