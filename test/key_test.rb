require './lib/key'
require 'minitest/autorun'
require 'minitest/pride'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new
  end

end
