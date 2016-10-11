require_relative "command"
require_relative "responses"
require 'pry'

class Repl
  include Responses

  attr_reader :command

  def initialize
    @command = Command.new
    welcome
  end

  def welcome
    start_sequence
  end

  def start_sequence
    Responses.welcome
    command.input = gets.chomp.downcase
    if command.input.eql?("play") || command.input.eql?("p")
      Responses.game_start
      play
    elsif command.input.eql?("quit") || command.input.eql?("q")
      quit
    elsif command.input.eql?("instructions") || command.input.eql?("i")
      instructions
    elsif command.input.eql?("cheat") || command.input.eql?("c")
      cheat
    else
      start_sequence
    end
  end

  def play
      command.input = gets.chomp.downcase
      command.start
      while command.won.eql?(false)
      Responses.guess
      command.input = gets.chomp.downcase
      command.won?
      break if command.input.eql?('q') || command.input.eql?('quit')
      end
  end

  def quit
    command.game_over
  end

  def instructions
    Responses.instructions
    start_sequence
  end

  def cheat
    print command.guess.code
    start_sequence
  end

end


Repl.new
