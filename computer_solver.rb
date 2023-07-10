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

  # def create_all_guesses
  #   until @all_possible_guesses.length == 1296
  #     number = 4.times.map{rand(1..6)}.join
  #     @all_possible_guesses.push(number)
  #     @all_possible_guesses.uniq!
  #     @all_possible_guesses.sort!
  #   end
  # end

  def create_all_answers
    choices = ["partial_guess", "exact_guess", "incorrect_guess"]
    until @all_possible_answers.length == 15
      answer = []
      4.times {answer.push(choices[rand(choices.size)])}
      @all_possible_answers.push(answer)
      @all_possible_answers.uniq!
    end
  end

  def game
    set_up_algorithm
    @code = user_prompt
    12.times {play_round}
    game_lost(@game_type, @code)
  end

  def set_up_algorithm      
    create_all_answers
    @s = @all_possible_guesses.clone
  end

  def play_round
    sleep(1)

    #BREAKS IN CLUES - ERROR UNDEFINED METHOD 'SPLIT' FOR NIL CLASS
    clues = check_for_match
    update_guess(clues)

  end

  # check the computer's guess vs. the code - return the clues as an array
  def check_for_match

    #COMPUTER BREAKS HERE - SENDING NOTHING SOMETIMES BECAUSE S IS EMPTY
    clues = compare_codes(@code, @guess)
    
    show_results(@guess, clues)
    if is_there_a_winner(@code, @guess) then there_is_a_winner(@game_type) end
    clues 
  end

  def update_guess(current_clue)
    @all_possible_guesses -= [@guess]
    update_s(current_clue)
    #@guess = minimax
    # puts @s
    @guess = @s.sample
  end

  def update_s(current_clue)
    @s.each do |x|
      # puts "CODE = #{@guess} POTENTIAL GUESS = #{x}\nRESULT = #{compare_codes(@guess, x)} RESULT FOR COMPARISON = #{current_clue}"
      if compare_codes(@guess, x) != current_clue
        @s -= [x]
      end
    end 
  end

#--------------------IGNORE FROM HERE

  def minimax
    scores = {}
    @all_possible_guesses.each do |x|
      score = @s.size - calc_worst_possible_outcome(x).to_i
      scores[x] = score
    end
    # puts scores
    scores.key(scores.values.max)
    # exit
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
    # puts count_for_outcomes
    count_for_outcomes
  end
end


# what do we know?
# s is being generated correctly
# incorrect guesses are being removed from incorrect_guesses var correctly
# s is working
#2435 does not work
#CODE CHECKER IS NOT WORKING PROPERLY
