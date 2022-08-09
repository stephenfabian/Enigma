require './lib/enigma'

handle = File.open(ARGV[0], "r") 

incoming_text = handle.read

handle.close


enigma = Enigma.new

encrypt = enigma.encrypt(incoming_text)


writer = File.open(ARGV[1], "w")

writer.write(encrypt[:encryption]) 

writer.close

puts "Encrypted text has been written to #{ARGV[1]}, the key is #{encrypt[:key]} and the date is #{encrypt[:date]}." 










