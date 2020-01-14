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

  def test_it_can_encrypt

    encryption =
    {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
    }
require "pry"; binding.pry
    assert_equal encryption, @enigma.encrypt("hello world", "02715", "040895")
  end

end
