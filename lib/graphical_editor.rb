require 'init_command'
require 'clear_command'
require 'dot_fill_command'
require 'vertical_seg_command'
require 'horizontal_seg_command'
require 'fill_command'
require 'show_command'

# Public: Class represents graphical editor which can run different commands.
#
class GraphicalEditor

  COMMANDS = [
    InitCommand,
    ClearCommand,
    DotFillCommand,
    VerticalSegCommand,
    HorizontalSegCommand,
    FillCommand,
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
    else
      raise CommandNotRecognized
    end
  end

end