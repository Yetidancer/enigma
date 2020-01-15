require './lib/enigma'

enigma = Enigma.new

original_message = File.open(ARGV[0], 'r')

text = original_message.read

original_message.close

new_message = enigma.encrypt(text)

encrypted = File.open(ARGV[1], 'w')

encrypted.write(new_message[:encryption])

encrypted.close

puts "Created 'encrypted.txt' with the key #{new_message[:key]} and date #{new_message[:date]}"
