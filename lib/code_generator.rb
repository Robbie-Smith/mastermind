module CodeGenerator

  CODE = ["b","g","r","y"] * 6

  def self.generate(level=4)
    CODE.sample(level).join
  end

end
