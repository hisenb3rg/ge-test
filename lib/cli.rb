require 'graphical_editor'

# Public: Script for running interactive CLI of graphical editor
#
ge = GraphicalEditor.new

ARGF.each do |command|
  begin
    if command =~ /X/
      puts 'Bye, bye!'
      break

    else
      ge.run(command)
    end

  rescue GraphicalEditor::CommandNotRecognized
    puts 'Command was not recognized, please try again.'
  end
end