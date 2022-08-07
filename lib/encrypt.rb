require './lib/enigma'



handle = File.open(ARGV[0], "r") 

incoming_text = handle.read

handle.close



enigma = Enigma.new
encrypted_text = enigma.encrypt((incoming_text), "02715", "040895")[:encryption]


writer = File.open(ARGV[1], "w")


writer.write(encrypted_text)

writer.close

puts "Encrypted text is written to #{ARGV[1]}, the key is #{enigma.encrypt((incoming_text), "02715", "040895")[:key]} and the date is #{enigma.encrypt((incoming_text), "02715", "040895")[:date]}."









