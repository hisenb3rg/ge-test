require 'base_command'

class VerticalSegCommand < BaseCommand

  COMMAND_REGEX = /^V\s+(\d+)\s+(\d+)\s+(\d+)\s+([A-Z])/
  
  def process(x, y1, y2, color)
    for y in (y1..y2)
      @matrix[y-1][x-1] = color
    end
  end

end