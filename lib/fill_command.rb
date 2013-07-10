require 'base_command'

class FillCommand < BaseCommand

  COMMAND_REGEX = /^F\s+(\d+)\s+(\d+)\s+([A-Z])/
  
  def process(x, y, color)
    orig_color = @matrix[y-1][x-1]
    fill(y-1, x-1, color, orig_color)
  end


  protected

  def fill(y, x, color, orig_color)
    @matrix[y][x] = color

    for dot in neighbor_dots(y, x)
      if @matrix[dot.y][dot.x] == orig_color
        fill(dot.y, dot.x, color, orig_color)
      end
    end
  end

  def neighbor_dots(y, x)
    dot = Struct.new(:y, :x)
    [].tap do |dots|
      dots << dot[y - 1, x] if y > 0
      dots << dot[y + 1, x] if y + 1 < @matrix.size
      dots << dot[y, x - 1] if x > 0
      dots << dot[y, x + 1] if x + 1 < @matrix.first.size
    end
  end
  
end