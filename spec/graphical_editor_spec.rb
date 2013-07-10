require 'graphical_editor'

describe GraphicalEditor do

  # the minimal command interface implementation
  class FakeCommand < Struct.new(:matrix)
    COMMAND_REGEX = /fake/

    def run(cmd); true; end
  end

  describe '#run' do
    before { stub_const "GraphicalEditor::COMMANDS", [FakeCommand] }
    
    context 'when successful' do
      it 'runs appropriate command for given command string' do
        FakeCommand.any_instance.should_receive(:run).once.with('fake command')
        subject.run('fake command')
      end
    end

    context 'when unsuccessful' do
      it 'raises error when command not recognized' do
        expect { subject.run('NEW') }
          .to raise_error(GraphicalEditor::CommandNotRecognized)
      end
    end
  end

end