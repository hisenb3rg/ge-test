require 'init_command'
require 'clear_command'
require 'dot_fill_command'
require 'show_command'


class CommandProcessor

  COMMANDS = {
    'I' => InitCommand,
    'C' => ClearCommand,
    'L' => DotFillCommand,
    'S' => ShowCommand
  }
  def initialize
    @matrix = nil
  end

  def process(command_string)
    command, args = parse(command_string)

    if command == 'X'
      return false

    elsif COMMANDS.keys.include?(command)
      command_instance = COMMANDS[command].new(@matrix)
      @matrix = command_instance.process(*args)
    end
  end

  def parse(command_string)
    tokens = command_string.split(' ')
    command = tokens.first
    args = tokens[1..-1].map {|x| Integer(x) rescue x }

    [command, args]
  end
end