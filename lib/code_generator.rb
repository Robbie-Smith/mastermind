class CodeGenerator
  def initialize
    @code = ["b","g","r","y"]
  end

  def generate(num=4)
    level = num
    (@code * 6).shuffle.sample(level).join
  end

end
