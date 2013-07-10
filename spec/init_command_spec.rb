require 'init_command'

describe InitCommand do

  describe '#run' do
    it 'recognizes commands like I M N' do
      subject.run('I 10 100').should_not be_nil
      subject.run('I 55 1').should_not be_nil
      subject.run('I  10 55 ').should_not be_nil
    end

    it 'returns newly initialized matrix' do
      subject.run('I 3 3').should eq([
        %w(O O O), %w(O O O), %w(O O O)
      ])
    end
  end

end