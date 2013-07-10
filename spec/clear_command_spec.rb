require 'clear_command'

describe ClearCommand do

  subject { ClearCommand.new(matrix) }
  let(:matrix) { [%w(X A A), %w(X A A)] }

  describe '#run' do
    it 'recognizes commands like C' do
      subject.run('C').should_not be_nil
      subject.run('C  ').should_not be_nil
    end

    it 'returns newly initialized matrix' do
      subject.run('C').should eq([
        %w(O O O), %w(O O O)
      ])
    end
  end

end