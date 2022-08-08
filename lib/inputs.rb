require 'date'
class Inputs   
   # ***** ORIGINAL METHOD *************
  #  def key_generator(*details)   
  #     if !details[1].nil? && details[1].size == 5 
  #       key = details[1]
  #     else
  #       random_4_digits = rand.to_s[3..6]
  #       key = "0#{random_4_digits.to_i}"
  #     end
  #     key
  #   end

  # ******** REVISED METHOD ***********
   def key_generator(key)   
      if !key.nil?
        key_to_use = key
      else
        random_4_digits = rand.to_s[3..6]
        key_to_use = "0#{random_4_digits.to_i}"
      end
      key_to_use
    end
   # ***** ORIGINAL METHOD *************
    # def date_generator(*details) 
    #   if !details[1].nil? && details[1].size == 6
    #    date = details[1] 
    #   elsif !details[2].nil?
    #     date = details[2]
    #   elsif details[1].nil?
    #       date = Date.today.strftime("%m%d%C")
    #   else
    #     date = Date.today.strftime("%m%d%C")
    #   end
    #   date
    # end
# ******** REVISED METHOD ***********
    def date_generator(date) 
      if !date.nil?
        date_to_use = date
      else
        date_to_use = Date.today.strftime("%m%d%C")
      end
      date_to_use
    end

end