  require 'date'
  require_relative './rotate'
  require_relative './shiftable'

  class Enigma
    include Shiftable

    def initialize
      @rotate = Rotate.new
    end

    def encrypt(message, key=nil, date=nil)
      encrypt_hash = Hash.new(0)
      key = key_generator(key)
      date = date_generator(date)
      shifts = shifts_hash(key, date)
      encrypt_hash[:encryption] = @rotate.rotate_message(message, shifts)
      encrypt_hash[:key] = key
      encrypt_hash[:date] = date
      encrypt_hash
    end

    def decrypt(ciphertext, key=nil, date=nil)
      decrypt_hash = Hash.new(0)
      key = key_generator(key)
      date = date_generator(date)
      shifts = shifts_hash_backwards(key, date)
      decrypt_hash[:decryption] = @rotate.rotate_message(ciphertext, shifts)
      decrypt_hash[:key] = key
      decrypt_hash[:date] = date
      decrypt_hash
    end

    def key_generator(key)   
      if !key.nil?
        key_to_use = key
      else
        random_5_digits = rand.to_s[2..6]
        key_to_use = random_5_digits.gsub(random_5_digits[0],"0")
      end
      key_to_use
    end

    def date_generator(date) 
      if !date.nil?
        date_to_use = date
      else
        date_to_use = Date.today.strftime("%m%d%y")
      end
      date_to_use
    end

  end