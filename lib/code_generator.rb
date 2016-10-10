require 'colorize'
module CodeGenerator
  CODE = ["b","g","r","y"]

  def self.generate(level=4)
    (CODE * 6).shuffle.sample(level).join
  end

end
