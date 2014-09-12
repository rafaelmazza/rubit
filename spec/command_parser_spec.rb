require 'spec_helper'

describe Rubit::CommandParser do
  describe '.parse' do
    it 'instantiates a command class according to input command' do
      command_input = 'X'
      expect(Rubit::CommandX).to receive(:new)
      Rubit::CommandParser.parse(command_input)
    end

    it 'pass the arguments from input to command initialize' do
      command_input = 'I 5 6'
      expect(Rubit::CommandI).to receive(:new).with(5, 6)
      Rubit::CommandParser.parse(command_input)
    end
  end
end

describe Rubit::CommandI do
  describe '#execute' do
    let(:columns) { 5 }
    let(:rows) { 6 }
    subject { Rubit::CommandI.new(columns, rows) }
    it 'creates a bitmap' do
      bitmap = double
      expect(Rubit::Bitmap).to receive(:new).with(columns, rows)
      subject.execute(bitmap)
    end
  end
end

