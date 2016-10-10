require_relative "guesser"
require_relative "timer"
require_relative "code_generator"
class Command
  include CodeGenerator

  attr_reader :guess, :timer
  attr_accessor :input

  def initialize(override_code = nil)
    code = override_code || CodeGenerator.generate
    @guess = Guesser.new(code)
    @timer = Timer.new
    @won = false
  end

  def start
    # binding.pry
    guess.user_input = input
    if guess.correct_code.eql?(false)
      time_start
      guess.start
    end
  end

  def won?
    if guess.correct_code.eql?(true)
      @won = true
      time_end
    else
      @won = false
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
