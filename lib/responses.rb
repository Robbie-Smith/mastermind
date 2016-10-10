module Responses
extend self
  def guess_response_1
    puts "No special characters or numbers."
  end

  def guess_response_2
    puts "Your input is to short."
  end

  def guess_response_3
    puts "Your input is to long."
  end

  def game_start
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def guess_element_response
    puts "'#{input}' has #{@element_holder[:element]} of the correct elements with #{@element_holder[:position]} in the correct positions
    You've taken #{guess_counter} guess"
  end

  def game_end
    puts "Congratulations! You guessed the sequence '#{input}' in #{@guess_counter} guesses over #{@elapsed_time}.\n
    Do you want to (p)lay again or (q)uit?"
  end

  def instructions
    #print out a short explanation of how the game is played
  end

  def cheat
    #show the current code
  end
end
