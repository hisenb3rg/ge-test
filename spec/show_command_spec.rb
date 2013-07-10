require 'show_command'

describe ShowCommand do

  subject { ShowCommand.new(matrix) }
  let(:matrix) { [%w(X A A), %w(X X X)] }

  describe '#run' do
    it 'recognizes commands like S' do
      subject.stub(:puts)
      subject.run('S').should_not be_nil
      subject.run('S  ').should_not be_nil
    end

    it 'puts out the matrix' do
      subject.should_receive(:puts).with('XAA').ordered
      subject.should_receive(:puts).with('XXX').ordered
      subject.run('S')
    end
  end

end