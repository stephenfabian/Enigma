require 'date'

class Enigma
  

  def offsets_hash
 
  end


  def encrypt(*details)

    encrypt_hash = Hash.new(0)
    #MESSAGE
    encrypt_hash[:encryption] = details[0]
    #-------------------------------------
    #KEY - hash output
    if !details[1].nil? && details[1].size == 5 
      encrypt_hash[:key] = details[1]
    else
      encrypt_hash[:key] = rand.to_s[2..6]
    end
    #Keys A-D


    require 'pry'; binding.pry
    #--------------------------------------------
    #DATE
    if !details[2].nil? && details[2].size == 6 
      encrypt_hash[:date] = details[2]
    else
        encrypt_hash[:date] = Date.today.strftime("%m%d%C")
    end
    #--------------------------------------------

    # offsets(date) ****
    #OFFSETS

    #--------------------------------------------
    encrypt_hash
  end
 
end