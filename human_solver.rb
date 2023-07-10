require_relative 'text_content.rb'
require_relative 'logic.rb'
require_relative 'display.rb'

class HumanSolver

  include TextContent
  include Logic

  def initialize
    @code = ""    
    @game_type = "human_solver"
  end

  def game
    intro(@game_type)
    @code = set_code
    12.times {play_round}
    game_lost(@game_type, @code)
  end
  
  def set_code
    4.times.map{rand(1..6)}.join
  end

  def play_round
    guess = user_prompt
    clues = compare_codes(@code, guess)
    show_results(guess, clues)
    if is_there_a_winner(@code, guess) then there_is_a_winner(@game_type) end  
  end

end
