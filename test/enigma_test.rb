require './lib/key'
require './lib/encrypted_message'
require './lib/decrypted_message'
require './lib/enigma'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'


class EnigmaTest < Minitest::Test

  def setup
    @key = Key.new("12345","121212")
    @message = Message.new("hello world")
    @reverse_message = Message.new("ajwghegjkqo")
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end


end
