require_relative '../lib/code_generator.rb'

class Tracker
  attr_reader :start_time, :end_time, :elapsed_time
    def initialize
      @time = Time.new
      @start_time = time_in_seconds
      @end_time = time_in_seconds
    end

    def time_in_seconds
      (@time.min * 60) + @time.sec
    end

    def time_difference_calculation
      elapsed_time(end_time - start_time)
    end

    def elapsed_time(seconds)
      if seconds < 3600
        Time.at(seconds).strftime "%M:%S"
      else
        hour = seconds / 3600
        "#{hour}:#{Time.at(seconds).strftime "%M:%S"}"
      end
    end
end
