require './lib/enigma'

handle = File.open(ARGV[0], "r") 

incoming_text = handle.read

handle.close


enigma = Enigma.new

decrypted_text = enigma.decrypt(incoming_text, ARGV[2], ARGV[3])[:encryption]



writer = File.open(ARGV[1], "w")

writer.write(decrypted_text)

writer.close

puts "Decrypted message has been written to #{ARGV[1]}, the key used for decryption was #{ARGV[2]}, and the date used for decryption was #{ARGV[3]}."