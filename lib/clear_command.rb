require 'init_command'
require 'colors'

class ClearCommand < InitCommand

  COMMAND_REGEX = /^C/

  def process
    super(@matrix.first.size, @matrix.size)
  end

end