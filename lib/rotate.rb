require_relative './shiftable'

class Rotate
  include Shiftable

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
    downcase_char = character.downcase
    alphabet_array = ("a".."z").to_a << " "
    rotated_alphabet_array = alphabet_array.rotate(shift)
    return character if !alphabet_array.include?(downcase_char)
    rotated_alphabet_array[alphabet_array.find_index(downcase_char)]
  end
end