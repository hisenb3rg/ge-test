require 'base_command'

class ShowCommand < BaseCommand
  
  COMMAND_REGEX = /^S/

  def process
    for row in @matrix
      puts row.join
    end
  end

end  