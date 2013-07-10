require 'graphical_editor'

ge = GraphicalEditor.new

ARGF.each do |command|
  begin
    success = ge.run(command)
    if not success
      puts 'Bye, bye!'
      break
    end

  rescue GraphicalEditor::CommandNotRecognized
    puts 'Command was not recognized, please try again.'
  end
end