module Responses
extend self

  def welcome
    puts "Welcome to MASTERMIND!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def command
    puts "\nEnter your command below:"
    print "> "
  end

  def guess
    puts "\nEnter your guess below:"
    print "> "
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
    puts "\nI have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game.\n"
  end


  def game_end(input,counter,elapsed_time)
    guess = proper_grammer(counter)
    puts "\nCongratulations! You guessed the sequence '#{input.upcase}' in #{counter} #{guess} over #{elapsed_time}."
    print "Do you want to play again or quit? p/q "
  end

  def guess_element_response(input,element,position,counter)
    guess = proper_grammer(counter)
    if input.chars.each {|letter| true if letter.eql?(input)}
      puts "\n'#{input.upcase}' has #{element} of the correct elements with #{position} in the correct position.\nYou've taken #{counter} #{guess}.\n"
    end
    # binding.pry
  end

  def proper_grammer(counter)
    if counter.eql?(1)
      guess = "guess"
    else
      guess = "guesses"
    end
  end

  def instructions
    puts "The goal of mastermind is guess the the secret code.\nYou will start with four color combinations: Blue, Red, Green, Yellow.\nYou could also type 'cheat' or 'c' to see the code."
  end


end
