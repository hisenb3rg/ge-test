class InitCommand
  
  def initialize(matrix)
    @matrix = matrix
  end

  def process(columns, rows)
    matrix = []

    rows.times do
      matrix << Array.new(columns, Colors::WHITE)
    end

    @matrix = matrix
  end
end  