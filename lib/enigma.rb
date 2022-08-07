  require 'date'

  class Enigma

    # def initialize(message, key, date)
    #   @date = date
    #   @key = key
    #   @date = date

    # end

      def keys_hash(key)
        keys = Hash.new(0)

        keys[:a_key] = key[0..1].to_i
        keys[:b_key] = key[1..2].to_i
        keys[:c_key] = key[2..3].to_i
        keys[:d_key] = key[3..4].to_i

        keys
      end

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

      def shifts_hash(key, date)
        shifts = Hash.new(0)
        shifts[:a_shift] = keys_hash(key)[:a_key] + offsets_hash(date)[:a_offset]
        shifts[:b_shift] = keys_hash(key)[:b_key] + offsets_hash(date)[:b_offset]
        shifts[:c_shift] = keys_hash(key)[:c_key] + offsets_hash(date)[:c_offset]
        shifts[:d_shift] = keys_hash(key)[:d_key] + offsets_hash(date)[:d_offset]

        shifts
      end

    def encrypt(*details)

      encrypt_hash = Hash.new(0)
      #MESSAGE
      encrypt_hash[:encryption] = details[0]

      #KEY -     #Keys A-D
      if !details[1].nil? && details[1].size == 5 
        encrypt_hash[:key] = details[1]
      else
        encrypt_hash[:key] = rand.to_s[2..6]
      end

      #DATE ->     #OFFSETS
      if !details[2].nil? && details[2].size == 6 
        encrypt_hash[:date] = details[2]
      else
          encrypt_hash[:date] = Date.today.strftime("%m%d%C")
      end

    #SHIFTS
    
      shifts = (shifts_hash(encrypt_hash[:key], encrypt_hash[:date])).values
      message = encrypt_hash[:encryption].split("")
   
      alphabet_array = ("a".."z").to_a << " "

       
        encrypt_hash
    end

     
    def rotate_message(message, shifts)
      split_message = message.split("")
      shifted_message = []
      split_message.each.with_index do |msg_character, index|
        if (index.to_f % 4) == 0
          shifted_message << change_letter(msg_character, shifts[0])
        elsif (index % 4) == 1
          shifted_message << change_letter(msg_character, shifts[1])
        elsif (index % 4) == 2
          shifted_message << change_letter(msg_character, shifts[2])
        elsif (index % 4) == 3
          shifted_message << change_letter(msg_character, shifts[3])
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