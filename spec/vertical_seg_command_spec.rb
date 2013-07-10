require 'vertical_seg_command'

describe VerticalSegCommand do

  subject { VerticalSegCommand.new(matrix) }
  let(:matrix) { Array.new(20) { Array.new(20, 'X') } }

  describe '#run' do
    it 'recognizes commands like V X Y1 Y2 C' do
      subject.run('V 11 11 15 S').should_not be_nil
      subject.run('V 11  11   15  S  ').should_not be_nil
    end

    it 'draws vertical segment' do
      subject.run('V 2 11 15 Z')
      subject.matrix[9][1].should eq('X')
      subject.matrix[10][1].should eq('Z')
      subject.matrix[11][1].should eq('Z')
      subject.matrix[12][1].should eq('Z')
      subject.matrix[13][1].should eq('Z')
      subject.matrix[14][1].should eq('Z')
      subject.matrix[15][1].should eq('X')
    end
  end

end