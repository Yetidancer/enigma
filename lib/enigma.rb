require './lib/encrypted_message'
require './lib/decrypted_message'
require './lib/key'

class Enigma

  def initialize
  end

  def encrypt(message, key = 0, date = 0)
    message1 = EncryptedMessage.new(message)
    key1 = Key.new(key, date)

    key1.letter_shift
    message1.translate_message(key1)

    encryption = {encryption: message1.shifted_text, key: key1.key_digits, date: key1.date}
  end

  def decrypt(message, key = 0, date = 0)
    message1 = DecryptedMessage.new(message)
    key1 = Key.new(key, date)

    key1.letter_shift
    message1.translate_message(key1)

    decryption = {decryption: message1.shifted_text, key: key1.key_digits, date: key1.date}
  end

end
