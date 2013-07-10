class ShowCommand
  
  def initialize(matrix)
    @matrix = matrix
  end

  def process
    for row in @matrix
      puts row.join
    end

    @matrix
  end
end  