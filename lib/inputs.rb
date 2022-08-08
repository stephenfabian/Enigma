require 'date'
class Inputs   
   
   def key_generator(*details)   
      if !details[1].nil? && details[1].size == 5 
        key = details[1]
      else
        random_4_digits = rand.to_s[3..6]
        key = "0#{random_4_digits.to_i}"
      end
      key
    end

    def date_generator(*details) 
      if !details[1].nil? && details[1].size == 6
       date = details[1] 
      elsif !details[2].nil?
        date = details[2]
      elsif details[1].nil?
          date = Date.today.strftime("%m%d%C")
      else
        date = Date.today.strftime("%m%d%C")
      end
      date
    end

end