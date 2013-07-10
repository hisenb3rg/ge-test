class BaseCommand

  attr_reader :matrix

  class CommandStringNotRecognized < StandardError; end

  def initialize(matrix=nil)
    @matrix = matrix
  end

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