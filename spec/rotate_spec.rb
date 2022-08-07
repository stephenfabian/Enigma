require_relative 'spec_helper.rb'
require './rotate'

describe Rotate do
  before :each do
    @rotate = Rotate.new
  end

    it 'exists' do
      expect(@rotate).to be_an_instance_of(Rotate)
    end

    it '.rotate_message - can shift a whole message' do
      shifts = {:a_shift=>3, :b_shift=>27, :c_shift=>73, :d_shift=>20}

      expect(@rotate.rotate_message("hello world!", shifts)).to eq("keder ohulw!")
    end

    it '.change_letter - shift one character of a message' do
      expect(@rotate.change_letter("h", 3)).to eq("k")
    end

end