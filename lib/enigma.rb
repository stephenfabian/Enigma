  require 'date'
  require_relative './inputs'
  require_relative './rotate'
  require_relative './shiftable'

  class Enigma
    include Shiftable

    def initialize
      @inputs = Inputs.new
      @rotate = Rotate.new

    end

    def encrypt(message, key=nil, date=nil)

      encrypt_hash = Hash.new(0)

      key = @inputs.key_generator(key)
      date = @inputs.date_generator(date)

      shifts = shifts_hash(key, date)
       
      encrypt_hash[:encryption] = @rotate.rotate_message(message, shifts)
      encrypt_hash[:key] = key
      encrypt_hash[:date] = date

      encrypt_hash
    end

    def decrypt(ciphertext, key=nil, date=nil)

      decrypt_hash = Hash.new(0)

      key = @inputs.key_generator(key)
      date = @inputs.date_generator(date)

      shifts = shifts_hash_backwards(key, date)
   
      decrypt_hash[:decryption] = @rotate.rotate_message(ciphertext, shifts)
      decrypt_hash[:key] = key
      decrypt_hash[:date] = date

      decrypt_hash
    end

  end