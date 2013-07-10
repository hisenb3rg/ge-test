require 'horizontal_seg_command'

describe HorizontalSegCommand do

  subject { HorizontalSegCommand.new(matrix) }
  let(:matrix) { Array.new(20) { Array.new(20, 'X') } }

  describe '#run' do
    it 'recognizes commands like H X1 X2 Y C' do
      subject.run('H 11 15 4 S').should_not be_nil
      subject.run('H 11  11   15  S  ').should_not be_nil
    end

    it 'draws horizontal segment' do
      subject.run('H 5 10 12 Z')
      subject.matrix[11][3].should eq('X')
      subject.matrix[11][4].should eq('Z')
      subject.matrix[11][5].should eq('Z')
      subject.matrix[11][6].should eq('Z')
      subject.matrix[11][7].should eq('Z')
      subject.matrix[11][8].should eq('Z')
      subject.matrix[11][9].should eq('Z')
      subject.matrix[11][10].should eq('X')
    end
  end

end