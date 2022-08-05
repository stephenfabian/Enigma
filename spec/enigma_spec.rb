require './enigma'

describe Enigma do 

  xit 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'encrypt method can take a message, key and date arguments, return hash - encryption not functinal yet' do
    enigma = Enigma.new
    expected = {
                encryption: "hello world", #encryption not yet built
                key: "02715",
                date: "040895"
              }
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end
    
  xit 'can accept key and date as optional arguments - test1' do
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world")

    expect(encryption).to be_a(Hash)
    expect(encryption.keys.count).to eq(3)
  end

  xit 'can accept key and date as optional arguments - test2 ' do
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world", "02715")

    expect(encryption).to be_a(Hash)
    expect(encryption.keys.count).to eq(3)
  end
  
  xit 'can accept key and date as optional arguments - test3 ' do
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world", "040895")

    expect(encryption).to be_a(Hash)
    expect(encryption.keys.count).to eq(3)
  end
  
  xit 'has offsets A-D' do
   enigma = Enigma.new
   expected = { :a_offset => 1,
                :b_offset => 0,
                :c_offset => 2,
                :d_offset => 5,
              }

   expect(enigma.offsets_hash("040895")).to eq(expected)
   
  end

  xit 'can encrypt a message' do
    enigma = Enigma.new
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)

  end

end