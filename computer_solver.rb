require_relative 'text_content.rb'
require_relative 'logic.rb'
require_relative 'display.rb'
require_relative 'CONSTANT.rb'

class ComputerSolver

  include TextContent
  include Logic

  def initialize
    @code = ""  
    @game_type = "computer_solver"
    @guess = "1122"
    @round = 0
    @all_possible_guesses = ALL_POSSIBLE_GUESSES
    @all_possible_answers = []
    @s = []
  end

  def game
    @s = @all_possible_guesses.clone
    @code = user_prompt
    12.times {play_round}
    game_lost(@game_type, @code)
  end

  def play_round
    sleep(1)
    clues = check_for_match
    update_guess(clues)
  end

  def check_for_match
    clues = compare_codes(@code, @guess)    
    show_results(@guess, clues)
    if is_there_a_winner(@code, @guess) then there_is_a_winner(@game_type) end
    clues 
  end

  def update_guess(current_clue)
    @all_possible_guesses -= [@guess]
    update_s(current_clue)
    @guess = minimax
  end

  def update_s(current_clue)
    @s.each do |x|
      if compare_codes(@guess, x) != current_clue
        @s -= [x]
      end
    end 
  end

  def minimax
    scores = {}
    @all_possible_guesses.each do |x|
      score = @s.size - calc_worst_possible_outcome(x).to_i
      scores[x] = score
    end
    minimax = scores.values.max
    scores.each do |x|
      if x[1] == minimax
        if @s.include?(x[0])
          return x[0]
        end
      end
    end    
    scores.key(scores.values.max)
  end

  def calc_worst_possible_outcome(possible_next_guess)
    outcomes = figure_out_all_outcomes(possible_next_guess)
    count_for_each_outcome = count_outcomes(outcomes)
    count_for_each_outcome.values.min
  end

  def figure_out_all_outcomes(possible_next_guess)
    all_outcomes = []
    @s.each do |y|
      all_outcomes.push(compare_codes(possible_next_guess, y))
    end
    all_outcomes
  end

  def count_outcomes(arr)
    count_for_outcomes = {}
    arr.each do |x|
      if count_for_outcomes.key?(x)
        count_for_outcomes[x] += 1
      else
        count_for_outcomes[x] = 1
      end
    end
    count_for_outcomes
  end
end
