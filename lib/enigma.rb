class Enigma

  def initialize
  end

  def encrypt(message, key, date)
    message1 = EncryptedMessage.new(message)
    key1 = Key.new(key, date)

    key1.letter_shift
    message1.translate_message(key1)

    encryption = {encryption: message1.shifted_text, key: key, date: date}
  end

  def decrypt(message, key, date)
    message1 = DecryptedMessage.new(message)
    key1 = Key.new(key, date)

    key1.letter_shift
    message1.translate_message(key1)

    decryption = {decryption: message1.shifted_text, key: key, date: date}
  end

end
