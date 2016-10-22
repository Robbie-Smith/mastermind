require 'bundler/setup'
Bundler.require(:default)

module Responses
  extend self
  include Colorize

  RED = '(r)ed'.upcase.red
  GREEN = '(g)reen'.upcase.green
  BLUE = '(b)lue'.upcase.cyan
  YELLOW = "(y)ellow".upcase.yellow

  def welcome
    puts"\nWelcome to MASTERMIND!\nEnter one of the following commands:
    Enter: (p)lay for a beginner sequence.
    Enter: (m)edium for a medium sequence.
    Enter: (h)ard for a hard sequence.
    Enter: (i)nstructions to read the instructions.
    Enter: (q)uit to quit.
    Enter: (c)heat to see the current code.
    \nWhat would you like to do?"
  end

  def command
    puts "\nEnter your command below:".red
    print "> ".green.bold
  end

  def guess
    puts "\nEnter your guess below:".red
    print "> ".green
  end

  def guess_response_1
    puts "No special characters or numbers."
  end

  def guess_response_2
    puts "Your input is too short."
  end

  def guess_response_3
    puts "Your input is too long."
  end

  def game_start(input)
    game_response = {'beginner'=> 4, 'medium'=> 5, 'hard'=> 6}
    number = game_response[input]
    puts "\nI have generated a #{input} sequence with #{number} elements made up of:
    \n#{BLUE}, #{RED}, #{GREEN}, #{YELLOW}.
    \nUse (q)uit at any time to end the game.\n"
  end

  def game_end(input,counter,elapsed_time)
    guess = proper_grammer(counter)
    puts "\nCongratulations! You guessed the sequence '#{input.upcase}' in #{counter} #{guess} over #{elapsed_time}."
    print "Do you want to play again or quit? p/q "
  end

  def guess_element_response(input,element,position,counter)
    guess = proper_grammer(counter)
    if input.chars.each {|letter| true if letter.eql?(input)}
      puts "\n'#{input.upcase}' has #{element} of the correct elements with #{position} in the correct position.
       \nYou've taken #{counter} #{guess}.\n"
    end
  end

  def proper_grammer(counter)
    if counter.eql?(1)
      guess = "guess"
    else
      guess = "guesses"
    end
  end

  def instructions
    puts "The goal of mastermind is guess the the secret code. \nYou will start with four color combinations: #{BLUE}, #{RED}, #{GREEN}, #{YELLOW}.\nMastermind defaults to a beginner sequence, for an intermediate challenge type (m)edium or (h)ard for a difficult challenge.\nYou could also type 'cheat' or 'c' to see the code."
  end


end
