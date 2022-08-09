require_relative 'spec_helper.rb'
require './enigma'

describe Enigma do 

  before :each do 
    @enigma = Enigma.new
  end

    it 'exists' do
      expect(@enigma).to be_an_instance_of(Enigma)
    end

    it 'can return hash with encryption, key and date, when only a message is given' do
      encryption = @enigma.encrypt("hello world")

      expect(encryption).to be_a(Hash)
      expect(encryption.keys.count).to eq(3)
    end

    it 'can return hash with encryption, key and date, when only a message and key are given' do
      encryption = @enigma.encrypt("hello world", "02715")

      expect(encryption).to be_a(Hash)
      expect(encryption.keys.count).to eq(3)
    end
    
    it 'can return hash with encryption, key and date, when only a message and date are given' do
      encryption = @enigma.encrypt("hello world", "040895")

      expect(encryption).to be_a(Hash)
      expect(encryption.keys.count).to eq(3)
    end

    it '.key_generator - can generate the key, if key is not given, generate random one' do
      expect(@enigma.key_generator("02715")).to eq("02715")
      expect(@enigma.key_generator("03999")).to eq("03999")
      expect((@enigma.key_generator(nil)).length).to eq(5)
    end

  describe 'Shiftables' do

    it '.date_generator - returns the date given, if date is not given, generate todays date' do
      expect(@enigma.date_generator("040895")).to eq("040895")
      expect(@enigma.date_generator("040922")).to eq("040922")
      expect(@enigma.date_generator(nil)).to eq(Date.today.strftime("%m%d%y"))
    end

    it '.offsets_hash - finds offsets A-D when given date' do
      expected = { :a_offset => 1,
                  :b_offset => 0,
                  :c_offset => 2,
                  :d_offset => 5,
                 }

      expect(@enigma.offsets_hash("040895")).to eq(expected)
    end

    it '.keys_hash - finds keys A-D when a key is given' do
      expected = {
                  :a_key => 02,
                  :b_key => 27,
                  :c_key => 71,
                  :d_key => 15
                 }

      expect(@enigma.keys_hash("02715")).to eq(expected)
    end

    it '.shifts_hash - can calculate each shift: key + offset' do
      @enigma.keys_hash("02715")
      @enigma.offsets_hash("040895")

      expected = {
                  :a_shift => 3,
                  :b_shift => 27,
                  :c_shift => 73,
                  :d_shift => 20
                 }

      expect(@enigma.shifts_hash("02715", "040895")).to eq(expected)
    end

    it '.shifts_hash_backwards - can calculate each negative shift: key + offset' do
      @enigma.keys_hash("02715")
      @enigma.offsets_hash("040895")

      expected = {
                  :a_shift => -3,
                  :b_shift => -27,
                  :c_shift => -73,
                  :d_shift => -20
                 }

      expect(@enigma.shifts_hash_backwards("02715", "040895")).to eq(expected)
    end

    it '.encrypt - can return hash with encryption, key and date' do
      expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                 }

      expected2 = {
                  encryption: "vjqtbeaweqihssi!",
                  key: "08304",
                  date: "291018"
                  }

      expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
      expect(@enigma.encrypt("Hello world end!", "08304", "291018")).to eq(expected2)
    end

    it '.decrypt - takes ciphertext string/key, optional date as third argument, ouputs hash with decryption, key and date' do
      expected =  {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                  }

      expected2 = {
                  decryption: "hello world end!",
                  key: "08304",
                  date: "291018"
                  }

      expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
      expect(@enigma.decrypt("vjqtbeaweqihssi!", "08304", "291018")).to eq(expected2)
    end
  end
end