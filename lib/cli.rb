require 'command_processor'

cp = CommandProcessor.new

ARGF.each do |command|
  puts command
  result = cp.process(command)

  break if !result
end