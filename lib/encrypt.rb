require './lib/enigma'

  handle = File.open(ARGV[0], "r") 

  incoming_text = handle.read

  handle.close


  enigma = Enigma.new
  #1 - THIS WORKS - give encrypt three arguments
    # encrypt = enigma.encrypt(incoming_text, "82648", "240818")  

  #2 - THIS DOESN'T WORK - give encrypt only message argument
    # encrypt = enigma.encrypt(incoming_text)

  #3        - give encrypt message and key
    encrypt = enigma.encrypt(incoming_text, "82648")

  writer = File.open(ARGV[1], "w")

  #1
    # writer.write(enigma.encrypt(incoming_text, "82648", "240818")[:encryption]) 

  #2 and #3
    writer.write(encrypt[:encryption]) 

  writer.close

 
  puts "Encrypted text is written to #{ARGV[1]}, the key is #{encrypt[:key]} and the date is #{encrypt[:date]}." 










