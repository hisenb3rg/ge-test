require 'base_command'

class DotFillCommand < BaseCommand

  COMMAND_REGEX = /^L\s+(\d+)\s+(\d+)\s+([A-Z])/
  
  def process(x, y, color)
    @matrix[y-1][x-1] = color
  end

end