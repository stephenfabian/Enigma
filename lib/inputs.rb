require 'date'
class Inputs   

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