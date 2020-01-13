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
    @message.text_to_array

    assert_equal ["h","o","r"], @message.a_array
  end

  def test_text_to_array_helper_method_populates_text_array_a
    @message.text_to_array_specific(0,@message.a_array)
    assert_equal ["h","o","r"], @message.a_array
  end

  def test_text_to_array_helper_method_populates_text_array_b
    @message.text_to_array_specific(-1,@message.b_array)
    assert_equal ["e"," ","l"], @message.b_array
  end

  def test_text_to_array_helper_method_populates_text_array_c
    @message.text_to_array_specific(-2,@message.c_array)
    assert_equal ["l","w","d"], @message.c_array
  end

  def test_text_to_array_helper_method_populates_text_array_d
    @message.text_to_array_specific(-3,@message.d_array)
    assert_equal ["l","o"], @message.d_array
  end

  def test_text_to_array_populates_text_arrays
    @message.text_to_array

    assert_equal ["h","o","r"], @message.a_array
    assert_equal ["e"," ","l"], @message.b_array
    assert_equal ["l","w","d"], @message.c_array
    assert_equal ["l","o"], @message.d_array
  end

  def test_it_can_apply_shift_to_text_arrays
    @message.text_to_array
    @key.date = "121212"
    @key.letter_shift
    @message.shift_text_array_specific(@key,@message.b_array,@key.b_shift,@message.b_shifted)

    assert_equal ["j","e","q"], @message.b_shifted
  end

  def test_it_can_shift_all_text_arrays_simultaneously
    @message.text_to_array
    @key.date = "121212"
    @key.letter_shift
    @message.shift_text_array(@key)

    assert_equal ["a", "h", "k"], @message.a_shifted
    assert_equal ["j","e","q"], @message.b_shifted
    assert_equal ["w", "g", "o"], @message.c_shifted
    assert_equal ["g", "j"], @message.d_shifted
  end

  def test_make_shifted_array_method
    @message.text_to_array
    @key.date = "121212"
    @key.letter_shift

    assert_equal ["a","j","w","g","h","e","g","j","k","q","o",nil], @message.make_shifted_array(@key)
  end

  def test_it_can_reform_text_string_after_shift
    @message.text_to_array
    @key.date = "121212"
    @key.letter_shift
    @message.reform_shifted_text(@key)

    assert_equal "ajwghegjkqo", @message.shifted_text
  end

  def test_single_method_for_translate_exists
    @key.date = "121212"
    @key.letter_shift
    @message.translate_message(@key)

    assert_equal "ajwghegjkqo", @message.shifted_text
  end
end
