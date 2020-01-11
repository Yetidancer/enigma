require './lib/key'
require 'minitest/autorun'
require 'minitest/pride'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_generates_alph_upon_initialize
    assert_equals 27, @key.alphabet
  end

end
