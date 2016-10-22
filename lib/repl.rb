require "./lib/controller"
require "./lib/responses"

class Repl
  include Responses

  def initialize
    @controller = Controller.new
    @game_on = false
    welcome
  end

  def welcome
    Responses.welcome
    start_sequence(correct_response)
  end

  def start_sequence(input=nil)
    input = @controller.input
    if input.eql?("quit") || input.eql?("q")
      quit(input)
    elsif input.eql?("instructions") || input.eql?("i")
      instructions
    elsif input.eql?("cheat") || input.eql?("c")
      cheat
    elsif play_command_check(input)
    else
      welcome
    end
  end

  def correct_response
    if @game_on.eql?(true)
      Responses.guess
      input = input_setter
    elsif @game_on.eql?(false)
      Responses.command
      input = input_setter
    end
  end

  def input_setter
    @controller.input = gets.chomp.downcase
  end

  def instructions
    Responses.instructions
    @game_on = false
    welcome
  end

  def cheat
    puts "Here is your cheat code: "
    print (@controller.guess.code).upcase.light_green.bold
    play
  end

  def play_command_check(input)
    if input.eql?('medium') || input.eql?('m')
      @controller.guess.code = CodeGenerator.generate(level=5)
      play(input='medium')
    elsif input.eql?('hard') || input.eql?('h')
      @controller.guess.code = CodeGenerator.generate(level=6)
      play(input='hard')
    elsif @game_on.eql?(true)
      play
    elsif input.eql?("play") || input.eql?("p")
      play
    end
  end

  def play(input='beginner')
    if @game_on.eql?(false)
      @game_on = true
      Responses.game_start(input)
      correct_response
      @controller.check_input
    elsif @game_on.eql?(true)
      correct_response
      @controller.check_input
    end
    code_check
  end

  def code_check
    if @controller.guess.correct_code.eql?(true)
      end_flow
    elsif @controller.guess.correct_code.eql?(false)
      start_sequence
    end
  end

  def end_flow
    @game_on = false
    response = correct_response
    if response.eql?('p') || response.eql?('play')
      reset_variables
    elsif response.eql?('q') || response.eql?('quit')
      quit(response)
    end
  end

  def reset_variables
    @controller.guess.counter = 0
    @controller.guess.correct_code = false
    @controller.timer.start_game = false
    @controller.timer.end_game = false
    @controller.rows = []
    @controller.guess.code = CodeGenerator.generate
    welcome
  end

  def quit(input)
    if input.eql?('q') || input.eql?('quit')
      @game_on = false
      puts Kimble.quote.light_cyan
      exit
    end
  end

end

Repl.new
