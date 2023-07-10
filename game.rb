require_relative 'text_instructions.rb'
require_relative 'display.rb'
require_relative 'human_solver.rb'
require_relative 'text_content.rb'
require_relative 'logic'
require_relative 'computer_solver.rb'

class Game

  include TextContent
  include Logic
  
  # def initialize
  #   # @code = ""
  #   @game_type = ""
  # end

  def play
    puts TextInstructions.new
    game_type = set_game_type
    code_maker if game_type == "computer_solver"
    code_breaker if game_type == "human_solver"    

    # game.set_code
    # 12.times {play_round}
    # game_lost(@code)
  end

  def code_maker
    maker = ComputerSolver.new
    maker.game
  end

  def code_breaker
    breaker = HumanSolver.new
    breaker.game
  end

  # def set_code
  #   @code = HumanSolver.new.set_code
  # end

  # def game_type
  #   @game_type
  # end   

  # def play_round
  #   guess = user_prompt
  #   clues = compare_codes(@code, guess)
  #   show_results(guess, clues)
  #   if is_there_a_winner(@code, guess) then there_is_a_winner end   
  # end
    
end


  # def play
  #   puts instructions
  #   game_mode = mode_selection
  #   code_maker if game_mode == '1'
  #   code_breaker if game_mode == '2'
  # end

  # def mode_selection
  #   input = gets.chomp
  #   return input if input.match(/^[1-2]$/)

  #   puts warning_message('answer_error')
  #   mode_selection
  # end

  # def code_maker
  #   maker = ComputerSolver.new
  #   maker.computer_start
  # end

  # def code_breaker
  #   breaker = HumanSolver.new
  #   breaker.player_turns
  # end
