require 'base_command'

class HorizontalSegCommand < BaseCommand

  COMMAND_REGEX = /^H\s+(\d+)\s+(\d+)\s+(\d+)\s+([A-Z])/
  
  def process(x1, x2, y, color)
    for x in (x1..x2)
      @matrix[y-1][x-1] = color
    end
  end

end