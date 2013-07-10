require 'init_command'
require 'clear_command'
require 'dot_fill_command'
require 'show_command'

class GraphicalEditor

  COMMANDS = [
    InitCommand,
    ClearCommand,
    DotFillCommand,
    ShowCommand
  ]

  class CommandNotRecognized < StandardError; end


  def initialize
    @matrix = nil
  end

  def run(cmd_string)
    cmd = COMMANDS.find {|c| c::COMMAND_REGEX.match(cmd_string) }

    if cmd
      @matrix = cmd.new(@matrix).run(cmd_string)
    elsif cmd_string =~ /X/
      false
    else
      raise CommandNotRecognized
    end
  end

end