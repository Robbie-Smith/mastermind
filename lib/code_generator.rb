require 'colorize'
module CodeGenerator
  CODE = ["b","g","r","y"] * 6
  # CODE = ["\e[0;39;42m \e[0m", "\e[0;39;41m \e[0m", "\e[0;39;44m \e[0m", "\e[0;39;43m \e[0m"]

  def self.generate(level=4)
    CODE.shuffle.sample(level).join
  end

end
