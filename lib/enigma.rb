  require 'date'
  require './inputs'

  class Enigma

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
    def keys_hash(key) 
      keys = Hash.new(0)

      keys[:a_key] = key[0..1].to_i
      keys[:b_key] = key[1..2].to_i
      keys[:c_key] = key[2..3].to_i
      keys[:d_key] = key[3..4].to_i

      keys
    end

    #4 # helper for #5 - shifts_hash
    def offsets_hash(date)
      offsets = Hash.new(0)
      date_squared = date.to_i * date.to_i
      last_four_digits_array = date_squared.digits.first(4).reverse

      offsets[:a_offset] = last_four_digits_array[0]
      offsets[:b_offset] = last_four_digits_array[1]
      offsets[:c_offset] = last_four_digits_array[2]
      offsets[:d_offset] = last_four_digits_array[3]

      offsets
    end 

    #6 - helper for encryption, decryption, rotate message, and change_letter
    def shifts_hash(key, date) 
      shifts = Hash.new(0)
      shifts[:a_shift] = keys_hash(key)[:a_key] + offsets_hash(date)[:a_offset]
      shifts[:b_shift] = keys_hash(key)[:b_key] + offsets_hash(date)[:b_offset]
      shifts[:c_shift] = keys_hash(key)[:c_key] + offsets_hash(date)[:c_offset]
      shifts[:d_shift] = keys_hash(key)[:d_key] + offsets_hash(date)[:d_offset]
      
      shifts
    end


    #7 - helper for encryption, decryption, rotate message, and change_letter
    def shifts_hash_backwards(key, date)
      shifts = Hash.new(0)
      shifts[:a_shift] = -(keys_hash(key)[:a_key] + offsets_hash(date)[:a_offset])
      shifts[:b_shift] = -(keys_hash(key)[:b_key] + offsets_hash(date)[:b_offset])
      shifts[:c_shift] = -(keys_hash(key)[:c_key] + offsets_hash(date)[:c_offset])
      shifts[:d_shift] = -(keys_hash(key)[:d_key] + offsets_hash(date)[:d_offset])

      shifts
    end

    def encrypt(*details)

      encrypt_hash = Hash.new(0)
      shifts = shifts_hash(key_generator(*details), date_generator(*details))
   
      encrypt_hash[:encryption] = rotate_message(details[0], shifts)
      
      encrypt_hash[:key] = key_generator(*details)

      encrypt_hash[:date] = date_generator(*details)

      encrypt_hash
    end

    def decrypt(*details)

      decrypt_hash = Hash.new(0)

      shifts = shifts_hash_backwards(key_generator(*details), date_generator(*details))
   
      decrypt_hash[:decryption] = rotate_message(details[0], shifts)
      
      decrypt_hash[:key] = key_generator(*details)

      decrypt_hash[:date] = date_generator(*details)

      decrypt_hash
    end

            

    def rotate_message(message, shifts)
      split_message = message.split("")
      shifted_message = []
      split_message.each.with_index do |msg_character, index|
        if (index.to_f % 4) == 0
          shifted_message << change_letter(msg_character, shifts[:a_shift])
        elsif (index % 4) == 1
          shifted_message << change_letter(msg_character, shifts[:b_shift])
        elsif (index % 4) == 2
          shifted_message << change_letter(msg_character, shifts[:c_shift])
        elsif (index % 4) == 3
          shifted_message << change_letter(msg_character, shifts[:d_shift])
        end
      end
      shifted_message.join
    end

    def change_letter(character, shift)
      alphabet_array = ("a".."z").to_a << " "
      rotated_alphabet = alphabet_array.rotate(shift)
      if !alphabet_array.include?(character)
          return character
      end
      rotated_alphabet[alphabet_array.find_index(character)]
    end
     

  end