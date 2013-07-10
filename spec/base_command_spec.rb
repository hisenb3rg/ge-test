require 'clear_command'

describe BaseCommand do

  # subject class will be a minimal subclass of BaseCommand
  # since this is the default usage of BaseCommand
  class TestCommand < BaseCommand
    COMMAND_REGEX = /^XYZ\s+(\d+)\s+(\d+)\s+([A-Z])/
    def process(x, y, c); end
  end

  subject { TestCommand.new(matrix) }
  let(:matrix) { nil }

  describe '#new' do
    let(:matrix) { [%w(A B C)] }

    it 'initializes matrix' do
      subject.matrix.should eq(matrix)
    end
  end

  describe '#run' do
    context 'when successful' do
      it 'runs command with extracted args as defined by regex' do
        subject.should_receive(:process).with(1, 2, 'S')
        subject.run('XYZ 1 2 S')
      end

      it 'returns updated matrix' do
        subject.run('XYZ 1 2 S').should subject.matrix
      end
    end

    context 'when unsuccessful' do
      it 'raises error when command string unrecognized' do
        expect { subject.run('ZZZ 12 32 32') }
          .to raise_error(BaseCommand::CommandStringNotRecognized)
      end
    end
  end
end

