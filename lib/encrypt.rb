require './lib/enigma'

  handle = File.open(ARGV[0], "r") 

  incoming_text = handle.read

  handle.close


  enigma = Enigma.new

  #1 - THIS DOESN'T WORK - give encrypt only message argument
    encrypt = enigma.encrypt(incoming_text)

  #2 - THIS WORKS - give encrypt three arguments
    # encrypt = enigma.encrypt(incoming_text, "82648", "240818")  

  #3 THIS WORKS - give encrypt message and key
    # encrypt = enigma.encrypt(incoming_text, "82648")

  writer = File.open(ARGV[1], "w")

  writer.write(encrypt[:encryption]) 

  writer.close

 
  puts "Encrypted text is written to #{ARGV[1]}, the key is #{encrypt[:key]} and the date is #{encrypt[:date]}." 










