module Responses
extend self

  def welcome
    puts "Welcome to MASTERMIND!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "Enter your command: "
  end

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
    puts "\nI have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game."
    print "What's your guess? "
  end

  def guess
    print "Enter your next guess: "
  end

  def game_end(input,counter,elapsed_time)
    counter.eql?(1) ? guess = "guess" : guess = "guesses"
    puts "\nCongratulations! You guessed the sequence '#{input.upcase}' in #{counter} #{guess} over #{elapsed_time}."

    print "Do you want to (p)lay again or (q)uit? "
  end

  def guess_element_response(input,element,position,counter)
    counter.eql?(1) ? guess = "guess" : guess = "guesses"
    if input.chars.include?('b') || input.chars.include?('y') || input.chars.include?('r')|| input.chars.include?('g')
      puts "\n'#{input.upcase}' has #{element} of the correct elements with #{position} in the correct positions.\nYou've taken #{counter} guess."
    end
  end


  def instructions
    puts "\nThe goal of mastermind is guess the the secret code.
     Easy mode: Four color combinations
     Medium mode: Five color combinations
     Hard mode: Six color combinatins.
     You could also type 'cheat' or 'c' to see the code."
  end

end
