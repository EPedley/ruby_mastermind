require_relative 'text_instructions.rb'
require_relative 'display.rb'
require_relative 'human_solver.rb'
require_relative 'text_content.rb'
require_relative 'logic'

class Game

  include TextContent
  include Logic
  include HumanResponse
  
  def initialize
    @code = ""
  end

  def play
    puts TextInstructions.new
    set_code
    12.times {play_round}
    game_lost(@code)
  end

  def set_code
    @code = HumanSolver.new.set_code
  end

  def play_round
    guess = user_prompt
    clues = compare_codes(@code, guess)
    show_results(guess, clues)
    if is_there_a_winner(@code, guess) then there_is_a_winner end   
  end
    
end

