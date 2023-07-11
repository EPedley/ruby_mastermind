require_relative 'text_instructions.rb'
require_relative 'display.rb'
require_relative 'human_solver.rb'
require_relative 'text_content.rb'
require_relative 'logic'
require_relative 'computer_solver.rb'

class Game

  include TextContent
  include Logic

  def play
    puts TextInstructions.new
    game_type = set_game_type
    code_maker if game_type == "computer_solver"
    code_breaker if game_type == "human_solver"    
  end

  def code_maker
    maker = ComputerSolver.new
    maker.game
  end

  def code_breaker
    breaker = HumanSolver.new
    breaker.game
  end
    
end
