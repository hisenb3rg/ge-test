# Public: Abstract class for implementation of graphical editor commands.
# It should be used this way:
# - subclassing this class
# - implementing process method which can modify the @matrix instance variable
# - defining COMMAND_REGEX regular expression
# It provides base matrix variable, common constructor and run method. 
# The latter checks command string compliance and parses the arguments.
#
class BaseCommand

  attr_reader :matrix

  class CommandStringNotRecognized < StandardError; end

  def initialize(matrix=nil)
    @matrix = matrix
  end

  # abstract method - so it raises error on call
  def process
    raise 'Process method must be implemented by the command class!'
  end

  def run(cmd)
    if recognized_args = self.class.extract_cmd_args(cmd)
      process(*recognized_args)
      @matrix
    else
      raise CommandStringNotRecognized
    end
  end


  protected

  def self.extract_cmd_args(string)
    if result = self::COMMAND_REGEX.match(string)
      result[1..-1].map {|arg| Integer(arg) rescue arg }
    else
      nil
    end
  end
end