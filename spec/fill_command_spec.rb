require 'fill_command'

describe FillCommand do

  subject { FillCommand.new(matrix) }
  let(:matrix) { Array.new(20) { Array.new(20, 'X') } }

  describe '#run' do
    it 'recognizes commands like F X Y C' do
      subject.run('F 11 15 S').should_not be_nil
    end

    context 'fills the region starting at given dot' do
      let(:matrix) { Array.new(10) { Array.new(10, 'X') } }
      before do
        for y in (0..9)
          matrix[y][3] = 'R'
        end
      end

      specify 'as by example #1' do
        subject.run('F 3 1 Z')
        for y in (0..9)
          subject.matrix[y].should eq(%w(Z Z Z R X X X X X X))
        end
      end

      specify 'as by example #2' do
        subject.run('F 4 1 Z')
        for y in (0..9)
          subject.matrix[y].should eq(%w(X X X Z X X X X X X))
        end
      end

      specify 'as by example #3' do
        for x in (0..9)
          matrix[6][x] = 'F'
        end
        subject.run('F 4 1 Z')
        subject.matrix[0].should eq(%w(X X X Z X X X X X X))
        subject.matrix[1].should eq(%w(X X X Z X X X X X X))
        subject.matrix[2].should eq(%w(X X X Z X X X X X X))
        subject.matrix[3].should eq(%w(X X X Z X X X X X X))
        subject.matrix[4].should eq(%w(X X X Z X X X X X X))
        subject.matrix[5].should eq(%w(X X X Z X X X X X X))
        subject.matrix[6].should eq(%w(F F F F F F F F F F))
        subject.matrix[7].should eq(%w(X X X R X X X X X X))
        subject.matrix[8].should eq(%w(X X X R X X X X X X))
        subject.matrix[9].should eq(%w(X X X R X X X X X X))
      end
    end
  end

end