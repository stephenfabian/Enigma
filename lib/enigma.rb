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

       # ***** ORIGINAL METHOD *************
    # def encrypt(*details)

    #   encrypt_hash = Hash.new(0)
    #   shifts = shifts_hash(@inputs.key_generator(*details), @inputs.date_generator(*details)) # fails here when encrypt has only message and key args
    #   encrypt_hash[:encryption] = @rotate.rotate_message(details[0], shifts)
      
    #   encrypt_hash[:key] = @inputs.key_generator(*details)

    #   encrypt_hash[:date] = @inputs.date_generator(*details)

    #   encrypt_hash
    # end
    

  # ******** REVISED METHOD ***********
    def encrypt(message, key=nil, date=nil)

      encrypt_hash = Hash.new(0)

      shifts = shifts_hash(@inputs.key_generator(key), @inputs.date_generator(date))
       
      encrypt_hash[:encryption] = @rotate.rotate_message(message, shifts)
      
      encrypt_hash[:key] = @inputs.key_generator(key)

      encrypt_hash[:date] = @inputs.date_generator(date)

      encrypt_hash
    end


           # ***** ORIGINAL METHOD *************
    # def decrypt(*details)

    #   decrypt_hash = Hash.new(0)

    #   shifts = shifts_hash_backwards(@inputs.key_generator(*details), @inputs.date_generator(*details))
   
    #   decrypt_hash[:decryption] = @rotate.rotate_message(details[0], shifts)
      
    #   decrypt_hash[:key] = @inputs.key_generator(*details)

    #   decrypt_hash[:date] = @inputs.date_generator(*details)

    #   decrypt_hash
    # end

      # ******** REVISED METHOD ***********
    def decrypt(ciphertext, key=nil, date=nil)

      decrypt_hash = Hash.new(0)

      shifts = shifts_hash_backwards(@inputs.key_generator(key), @inputs.date_generator(date))
   
      decrypt_hash[:decryption] = @rotate.rotate_message(ciphertext, shifts)
      
      decrypt_hash[:key] = @inputs.key_generator(key)

      decrypt_hash[:date] = @inputs.date_generator(date)

      decrypt_hash
    end

  end