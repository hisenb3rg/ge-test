class DotFillCommand
  
  def initialize(matrix)
    @matrix = matrix
  end

  def process(x, y, color)
    @matrix[y-1][x-1] = color
    @matrix
  end

end