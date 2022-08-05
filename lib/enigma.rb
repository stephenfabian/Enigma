require 'date'

class Enigma
  
  def encrypt(*details)

    encrypt_hash = Hash.new(0)
    encrypt_hash[:encryption] = details[0]
    
    if !details[1].nil? && details[1].size == 5 
      encrypt_hash[:key] = details[1]
    else
      encrypt_hash[:key] = rand.to_s[2..6]
    end

    if !details[2].nil? && details[2].size == 6 
      encrypt_hash[:date] = details[2]
    else
        encrypt_hash[:date] = Date.today.strftime("%m%d%C")
    end
    encrypt_hash
  end
 
end