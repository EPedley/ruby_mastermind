module Logic

  def set_game_type
    game_type = gets.chomp
    puts
    until game_type == "1" or game_type == "2"
      game_type_warning
      game_type = gets.chomp
    end
    game_type == "1" ? "computer_solver" : "human_solver"
  end
  
  def compare_codes(maker_code, guess)
    arr = []
    
    maker_code = maker_code.split("")
    guess_code = guess.split("")

    temp_maker_code = []
    temp_guess_code = []

    maker_code.each_with_index do |x, i|
      if guess_code[i] == x      
        arr.push("exact_guess")
      else
        temp_maker_code.push(maker_code[i])
        temp_guess_code.push(guess_code[i])
      end

    end

    temp_guess_code.each_with_index do |x, i|
      if temp_maker_code.include?(x)  
        temp_maker_code.delete_at(temp_maker_code.find_index(x))
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

  def user_prompt
    guess = ""
    loop do
      guess = get_code
      break if code_check(guess) == true
    end
  guess
  end

  def code_check(code)
    if code.length == 4 and code.match(/^[1-6]{4}$/)
      true
    else
      code_warning
      false
    end
  end
  
end
