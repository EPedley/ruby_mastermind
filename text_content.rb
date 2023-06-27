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

  def there_is_a_winner
    puts "#{"YOU GUESSED THE CODE CORRECTLY! YOU HAVE WON\n".bold.gold}"
    exit
  end

  def game_lost(code)
    puts "#{"YOU DIDN'T MANAGE TO GUESS THE CODE CORRECTLY! IT WAS #{code}. YOU HAVE LOST.\n".bold.red}"
    exit
  end

  def input_warning
    puts "\n#{"That is not a valid four digit code. Please try again.".brown}"
    puts
  end

  def get_input
    puts "Please enter your four digit code below:"
    gets.chomp
  end
  
end
