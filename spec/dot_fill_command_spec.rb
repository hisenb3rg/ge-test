require 'dot_fill_command'

describe DotFillCommand do

  subject { DotFillCommand.new(matrix) }
  let(:matrix) { Array.new(20) { Array.new(20, 'X') } }

  describe '#run' do
    it 'recognizes commands like L 2 3 A' do
      subject.run('L 15 3 A').should_not be_nil
      subject.run('L 12 11 A  ').should_not be_nil
    end

    it 'fills the dot with given color' do
      expect { subject.run('L 2 5 Z') }
        .to change { subject.matrix[4][1] }
        .from('X').to('Z')
    end
  end

end