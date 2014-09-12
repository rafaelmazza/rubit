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

describe Rubit::CommandF do
  describe '#execute' do
    let(:x) { 2 }
    let(:y) { 3 }
    let(:new_colour) { 'A' }
    let(:old_colour) { 0 }
    subject { Rubit::CommandF.new(x, y, new_colour) }
    it 'fills bitmap area' do
      bitmap = double()
      allow(bitmap).to receive(:get_colour) { 0 }
      expect(bitmap).to receive(:fill).with(x, y, new_colour, old_colour)
      subject.execute(bitmap)
    end
  end
end

describe Rubit::CommandL do
  describe '#execute' do
    let(:column) { 2 }
    let(:row) { 3 }
    let(:colour) { 'A' }
    subject { Rubit::CommandL.new(column, row, colour) }
    it 'colours a bitmap pixel' do
      bitmap = double()
      expect(bitmap).to receive(:set_colour).with(column, row, colour)
      subject.execute(bitmap)
    end
  end
end

describe Rubit::CommandI do
  describe '#execute' do
    let(:columns) { 5 }
    let(:rows) { 6 }
    subject { Rubit::CommandI.new(columns, rows) }
    it 'creates a bitmap' do
      bitmap = double()
      expect(Rubit::Bitmap).to receive(:new).with(columns, rows)
      subject.execute(bitmap)
    end
  end
end

