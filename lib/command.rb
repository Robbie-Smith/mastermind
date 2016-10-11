require_relative "guesser"
require_relative "timer"
require_relative "code_generator"
require_relative "responses"
require_relative "validate"

class Command
  include Validator
  include CodeGenerator
  include Responses

  attr_reader :guess, :timer, :won
  attr_accessor :input

  def initialize(override_code = nil)
    code = override_code || CodeGenerator.generate
    @guess = Guesser.new(code)
    @timer = Timer.new
    @won = false
  end

  def start
    guess.user_input = input
    time_start if timer.start_game.eql?(false)
    unless Validator.check_input_for_validity(guess.user_input,guess.code)
      guess.start
      print_guess
    end
  end

  def won?
    if guess.correct_code.eql?(true)
      time_end
      print_guess
      @won = true
      game_over
    elsif guess.counter > 0
      print_guess
      start
    end
  end

  def game_over
    if @won.eql?(true)
      elapsed_time = @timer.elapsed_time
      counter = @guess.counter
      Responses.game_end(input,counter,elapsed_time)
    else
      puts "Goodbye."
    end
  end

  def print_guess
    if !Validator.check_for_reserved_word(guess.user_input)
      Responses.guess_element_response(guess.user_input,guess.element_holder[:element],guess.element_holder[:position],guess.counter)
    end
  end

  def time_start
    if timer.start_game.eql?(false)
      timer.start_game = true
      timer.time_convert
    end
  end

  def time_end
    if timer.start_game.eql?(true)
      timer.time = Time.new
      timer.end_game = true
      timer.time_convert
    end
  end

end
