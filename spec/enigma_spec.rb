require_relative 'spec_helper.rb'
require './enigma'

describe Enigma do 

  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an_instance_of(Enigma)
  end
  
  it 'can accept key and date as optional arguments - test1' do
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world")

    expect(encryption).to be_a(Hash)
    expect(encryption.keys.count).to eq(3)
  end

  it 'can accept key and date as optional arguments - test2 ' do
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world", "02715")

    expect(encryption).to be_a(Hash)
    expect(encryption.keys.count).to eq(3)
  end
  
  it 'can accept key and date as optional arguments - test3 ' do
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world", "040895")

    expect(encryption).to be_a(Hash)
    expect(encryption.keys.count).to eq(3)
  end
  
  it '.offsets_hash - finds offsets A-D' do
   enigma = Enigma.new
   expected = { :a_offset => 1,
                :b_offset => 0,
                :c_offset => 2,
                :d_offset => 5,
              }

   expect(enigma.offsets_hash("040895")).to eq(expected)
   
  end

  it '.keys_hash - finds keys A-D' do
    enigma = Enigma.new
    
    expected = {
                  :a_key => 02,
                  :b_key => 27,
                  :c_key => 71,
                  :d_key => 15
                }
    expect(enigma.keys_hash("02715")).to eq(expected)
  end

  it '.shifts_hash - can calculate each shift: key + offset' do
    enigma = Enigma.new
    enigma.keys_hash("02715")
    enigma.offsets_hash("040895")

    expected = {
                :a_shift => 3,
                :b_shift => 27,
                :c_shift => 73,
                :d_shift => 20
              }
    expect(enigma.shifts_hash("02715", "040895")).to eq(expected)
  end

  it '.shifts_hash_backwards - can calculate each negative shift: key + offset' do
    enigma = Enigma.new
    enigma.keys_hash("02715")
    enigma.offsets_hash("040895")

    expected = {
                :a_shift => -3,
                :b_shift => -27,
                :c_shift => -73,
                :d_shift => -20
              }
    expect(enigma.shifts_hash_backwards("02715", "040895")).to eq(expected)
  end


  it '.encrypt - can return hash with encryption, key and date' do
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    # expect(enigma.encrypt("hello world", "03981", "080720")).to eq(expected) ***** this failed in runner

  end


  it '.decrypt - takes ciphertext string/key, optional date as third argument, ouputs hash with decryption, key and date' do
    enigma = Enigma.new
    expected =  {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                }

    expected2 =  {
                  decryption: "hello world",
                  key: "03981",
                  date: "080720"
                }


    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    expect(enigma.decrypt("sublzpmobau", "03981", "080720")).to eq(expected2)
  
  end
end