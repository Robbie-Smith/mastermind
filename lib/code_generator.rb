module CodeGenerator

  CODE = ["b","g","r","y"] #* 6

  def self.generate(level=4)
    (CODE*6).sample(level).join
  end

end
