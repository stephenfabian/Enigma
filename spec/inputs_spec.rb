require_relative 'spec_helper.rb'
require './inputs'

  describe Inputs do

    before :each do 
      @inputs = Inputs.new 
    end

    it 'Inputs class exists' do
      expect(@inputs).to be_an_instance_of(Inputs)
    end

    it 'can generate the key - if key is not given, generate random one' do
      expect(@inputs.key_generator("hello world", "02715", "040895")).to eq("02715")
      expect(@inputs.key_generator("hello world", "02715").length).to eq(5)
      expect(@inputs.key_generator("hello world").length).to eq(5)
    end

    it 'can generate the date - if date is not given, generate todays date'  do
      expect(@inputs.date_generator("hello world", "02715", "040895")).to eq("040895")
      expect(@inputs.date_generator("hello world", "040895")).to eq("040895")
      expect(@inputs.date_generator("hello world")).to eq(Date.today.strftime("%m%d%C"))
    end

  end