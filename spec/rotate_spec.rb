require './rotate'

describe Rotate do
  
  xit '.rotate_message - can shift a whole message' do
    enigma = Enigma.new
    shifts = {:a_shift=>3, :b_shift=>27, :c_shift=>73, :d_shift=>20}

    expect(enigma.rotate_message("hello world", shifts)).to eq("keder ohulw")
  end

  xit '.change_letter - shift one character of a message' do
    enigma = Enigma.new
    
    expect(enigma.change_letter("h", 3)).to eq("k")
  end

end