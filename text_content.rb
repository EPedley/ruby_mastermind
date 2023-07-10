require_relative 'human_solver.rb'

module TextContent

  def show_results(guess, clues)
    puts
    puts "#{display_code(guess)} #{display_clues(clues)}"
    puts
  end

  def display_code(guess)
    "#{"".code_colours(guess[0].to_i)}#{"".code_colours(guess[1].to_i)}#{"".code_colours(guess[2].to_i)}#{"".code_colours(guess[3].to_i)}"
  end

  def display_clues(clues)
    arr = []
    clues.each do |clue|
      if clue == "partial_guess" or clue == "exact_guess"
        arr.push("#{"".clue(clue)}")
      end
    end
    arr.join
  end

  def there_is_a_winner(game_type)
    if game_type == "human_solver"
      puts "#{"YOU GUESSED THE CODE CORRECTLY! YOU HAVE WON\n".bold.gold}"
      exit
    else
      puts "#{"THE COMPUTER SUCCESSFULLY GUESSED YOUR CODE!\n".bold.brown}"
      exit
    end
  end

  def game_lost(game_type, code)
    if game_type == "human_solver"
      puts "#{"YOU DIDN'T MANAGE TO GUESS THE CODE CORRECTLY! IT WAS #{code}. YOU HAVE LOST.\n".bold.brown}"
      exit
    else
      puts "#{"YOU WON! THE COMPUTER DIDN'T MANAGE TO GUESS YOUR CODE CORRECTLY!\n".bold.gold}"
      exit
    end
  end

  def game_type_warning
    puts "\n#{"That is not a valid game type. Please try again.".brown}"
    puts
  end

  def code_warning
    puts "\n#{"That is not a valid four digit code. Please try again.".brown}"
    puts
  end

  def get_code
    puts "Please enter your four digit code below:"
    gets.chomp
  end

  def intro(game_type)
    if game_type == "human_solver"
      puts "The computer has set a four digit code."
      puts
    end
    if game_type == "computer_solver"
      puts "Enter your four digit code below:"
      code = gets.chomp
      puts
      return code
    end
  end

  # def loading
  #   sleep(1)
  #   puts "#{"Loading...".grey}"
  #   puts
  # end
  
end
