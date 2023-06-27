require_relative 'display.rb'

class TextInstructions
  
  def to_s

    <<~HEREDOC
    
#{"welcome to mastermind".upcase.bold}

Mastermind is a code-breaking game for two players - in this game you will be playing against the computer!


#{"Instructions:".underline}

  - Decide whether you will be the code #{"MAKER".bold.green} or the code #{"BREAKER".bold.blue}.
  - The code #{"MAKER".bold.green} will set a four digit code that corresponds to the colours below. This can be any combination of colours including duplications!

  #{"".code_colours(1)}#{"".code_colours(2)}#{"".code_colours(3)}#{"".code_colours(4)}#{"".code_colours(5)}#{"".code_colours(6)}

  - Each turn the code #{"BREAKER".bold.blue} will try to guess the code #{"MAKER".bold.green}'s four digit code.
  - After each turn the code #{"BREAKER".bold.blue} will get clues on whether they guessed the correct colour and its correct location.
  - The code #{"BREAKER".bold.blue} has 12 turns to correctly guess the code or the code #{"MAKER".bold.green} wins!
  

#{"Clues:".underline}

  - After each guess, there will be up to four clues to help crack the code.

    #{"".clue("exact_guess")} This clue means you have 1 correct number in the correct location.

    #{"".clue("partial_guess")} This clue means you have 1 correct number, but in the wrong location.

#{"Example:".underline}

  - For example, the code #{"MAKER".bold.green} has set the following code:
  
    #{"".code_colours(2)}#{"".code_colours(5)}#{"".code_colours(4)}#{"".code_colours(1)}

  - The code #{"BREAKER".bold.blue} guesses 2356 and so they receive the following clues:

    #{"".code_colours(2)}#{"".code_colours(3)}#{"".code_colours(5)}#{"".code_colours(6)} #{"".clue("exact_guess")}#{"".clue("partial_guess")}

  - The guess had 1 correct colour in the correct location and 1 correct colour in the wrong location.
  

#{"IT'S GAME TIME".bold.underline}

The computer has set a four digit code - time to guess!
   
    HEREDOC
  end

end
