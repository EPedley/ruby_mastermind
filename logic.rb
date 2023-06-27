module Logic
  def compare_codes(maker_code, guess)
    arr = []
    
    maker_code = maker_code.split("")
    guess_code = guess.split("")

    temp_maker_code = []
    temp_guess_code = []

    maker_code.each_with_index do |x, i|
      if x == guess_code[i]
        arr.push("exact_guess")
      else
        temp_maker_code.push(x)
        temp_guess_code.push(guess_code[i])
      end
    end

    temp_maker_code.each_with_index do |y, j|
      if temp_guess_code.include?(y)
        arr.push("partial_guess")
      end
    end
    
    arr.sort
  end

  def is_there_a_winner(maker_code, breaker_code)  
    if maker_code == breaker_code
      true
    else
      false
    end
  end
end
