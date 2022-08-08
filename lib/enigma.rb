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

    #1 helper for encrypt/decrypt
    # def key_generator(*details)   
    #   if !details[1].nil? && details[1].size == 5 
    #     key = details[1]
    #   else
    #     random_4_digits = rand.to_s[3..6]
    #     key = "0#{random_4_digits.to_i}"
    #   end
    # end

    # #2 helper for encrypt/decrypt
    # def date_generator(*details) 
    #   if !details[1].nil? && details[1].size == 6
    #    date = details[1] 
    #   elsif !details[2].nil?
    #     date = details[2]
    #   elsif details[1].nil?
    #       date = Date.today.strftime("%m%d%C")
    #   end
    # end

    #3 helper for #5 - shifts_hash
    # def keys_hash(key) 
    #   keys = Hash.new(0)

    #   keys[:a_key] = key[0..1].to_i
    #   keys[:b_key] = key[1..2].to_i
    #   keys[:c_key] = key[2..3].to_i
    #   keys[:d_key] = key[3..4].to_i

    #   keys
    # end

    #4 # helper for #5 - shifts_hash
    # def offsets_hash(date)
    #   offsets = Hash.new(0)
    #   date_squared = date.to_i * date.to_i
    #   last_four_digits_array = date_squared.digits.first(4).reverse

    #   offsets[:a_offset] = last_four_digits_array[0]
    #   offsets[:b_offset] = last_four_digits_array[1]
    #   offsets[:c_offset] = last_four_digits_array[2]
    #   offsets[:d_offset] = last_four_digits_array[3]

    #   offsets
    # end 

    #6 - helper for encryption, decryption, rotate message, and change_letter
    # def shifts_hash(key, date) 
    #   shifts = Hash.new(0)
    #   shifts[:a_shift] = keys_hash(key)[:a_key] + offsets_hash(date)[:a_offset]
    #   shifts[:b_shift] = keys_hash(key)[:b_key] + offsets_hash(date)[:b_offset]
    #   shifts[:c_shift] = keys_hash(key)[:c_key] + offsets_hash(date)[:c_offset]
    #   shifts[:d_shift] = keys_hash(key)[:d_key] + offsets_hash(date)[:d_offset]
      
    #   shifts
    # end


    #7 - helper for encryption, decryption, rotate message, and change_letter
    # def shifts_hash_backwards(key, date)
    #   shifts = Hash.new(0)
    #   shifts[:a_shift] = -(keys_hash(key)[:a_key] + offsets_hash(date)[:a_offset])
    #   shifts[:b_shift] = -(keys_hash(key)[:b_key] + offsets_hash(date)[:b_offset])
    #   shifts[:c_shift] = -(keys_hash(key)[:c_key] + offsets_hash(date)[:c_offset])
    #   shifts[:d_shift] = -(keys_hash(key)[:d_key] + offsets_hash(date)[:d_offset])

    #   shifts
    # end


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

            

    # def rotate_message(message, shifts)
    #   split_message = message.split("")
    #   shifted_message = []
    #   split_message.each.with_index do |msg_character, index|
    #     if (index.to_f % 4) == 0
    #       shifted_message << change_letter(msg_character, shifts[:a_shift])
    #     elsif (index % 4) == 1
    #       shifted_message << change_letter(msg_character, shifts[:b_shift])
    #     elsif (index % 4) == 2
    #       shifted_message << change_letter(msg_character, shifts[:c_shift])
    #     elsif (index % 4) == 3
    #       shifted_message << change_letter(msg_character, shifts[:d_shift])
    #     end
    #   end
    #   shifted_message.join
    # end

    # def change_letter(character, shift)
    #   alphabet_array = ("a".."z").to_a << " "
    #   rotated_alphabet = alphabet_array.rotate(shift)
    #   if !alphabet_array.include?(character)
    #       return character
    #   end
    #   rotated_alphabet[alphabet_array.find_index(character)]
    # end
     

  end