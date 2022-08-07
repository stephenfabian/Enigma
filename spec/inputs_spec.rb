require './inputs'

  describe Inputs do

    xit 'can generate the key - if key is not given, generate random one' do
      enigma = Enigma.new

      expect(enigma.key_generator("hello world", "02715", "040895")).to eq("02715")
      expect(enigma.key_generator("hello world", "02715").length).to eq(5)
      expect(enigma.key_generator("hello world").length).to eq(5)
    end

    xit 'can generate the date - if date is not given, generate todays date'  do
      enigma = Enigma.new
    
      expect(enigma.date_generator("hello world", "02715", "040895")).to eq("040895")
      expect(enigma.date_generator("hello world", "040895")).to eq("040895")
      expect(enigma.date_generator("hello world")).to eq(Date.today.strftime("%m%d%C"))
    end