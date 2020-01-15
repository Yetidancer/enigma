require './lib/enigma'

enigma = Enigma.new

encrypted_message = File.open(ARGV[0], 'r')

text = encrypted_message.read

encrypted_message.close

decrypted_message = enigma.decrypt(text, ARGV[2], ARGV[3] = 0)

decrypted = File.open(ARGV[1], 'w')

decrypted.write(decrypted_message[:decryption])

decrypted.close

puts "Created 'decrypted.txt' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
