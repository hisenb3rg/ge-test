require 'colors'

class ClearCommand
  
  def initialize(matrix)
    @matrix = matrix
  end

  def process()
    for row_idx in 0..(@matrix.size - 1)
      for col_idx in 0..(@matrix[row_idx].size - 1)
        @matrix[row_idx][col_idx] = Colors::WHITE
      end
    end

    @matrix
  end
end