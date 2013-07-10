require 'base_command'
require 'colors'

class InitCommand < BaseCommand

  COMMAND_REGEX = /^I\s+(\d+)\s+(\d+)/

  def process(columns, rows)
    @matrix = Array.new(rows) { Array.new(columns, Colors::WHITE) }
  end

end  