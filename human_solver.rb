require_relative 'text_content.rb'

class HumanSolver
  
  def set_code
    4.times.map{rand(1..6)}.join
  end

end

module HumanResponse

  def user_prompt
    guess = ""
    loop do
      guess = get_input
      break if check_user_input(guess) == true
    end
  guess
  end
  
  def check_user_input(guess)
    if guess.length == 4 and guess.match(/^[1-6]{4}$/)
      true
    else
      input_warning
      false
    end
    # if guess.length == 4
    #   true 
    # else
    #   false
    # end
  end

end
