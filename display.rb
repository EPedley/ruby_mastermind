class String

  def bold
    "\e[1m#{self}\e[22m"
  end

  def underline
    "\e[4m#{self}\e[24m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def brown
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def grey
    "\e[30m#{self}\e[0m"
  end

  def gold
    "\e[33m#{self}\e[0m"
  end

  def code_colours(number)
    "\e[#{number + 41}m  #{number}  \e[0m "
  end

  def clue(clue)
    if clue == "exact_guess"
      "\e[37m\u25CF\e[0m "
    else
      "\e[37m\u25CB\e[0m "
    end
  end
end
