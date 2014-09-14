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

    context 'when command not found' do
      it 'raises name error' do
        command_input = 'G 3 3 C'
        expect { subject.parse(command_input) }.to raise_error(NameError)
      end
    end

    context 'when input wrong command arguments' do
      it 'raises argument error' do
        command_input = 'L 3 3'
        expect { Rubit::CommandParser.parse(command_input) }.to raise_error(ArgumentError)
      end
    end
  end
end

describe Rubit::CommandU do
  describe '#execute' do
    it 'calls bitmap undo' do
      bitmap = double
      expect(bitmap).to receive(:undo)
      subject.execute(bitmap)
    end

    it 'returns modified bitmap' do
      bitmap = double()
      allow(bitmap).to receive(:undo)
      expect(subject.execute(bitmap)).to eq(bitmap)
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
    let(:bitmap) { double.as_null_object }

    it 'fills bitmap area' do
      allow(bitmap).to receive(:get_colour) { 0 }
      expect(bitmap).to receive(:fill).with(x, y, new_colour, old_colour)
      subject.execute(bitmap)
    end

    it 'takes a bitmap snapshot' do
      expect(bitmap).to receive(:take_snapshot)
      subject.execute(bitmap)
    end
  end
end

describe Rubit::CommandH do
  subject { Rubit::CommandH.new(3, 4, 2, 'Z') }

  describe '#execute' do
    let(:bitmap) { double.as_null_object }

    it 'takes a bitmap snapshot' do
      expect(bitmap).to receive(:take_snapshot)
      subject.execute(bitmap)
    end
  end
end

describe Rubit::CommandV do
  subject { Rubit::CommandV.new(2, 3, 4, 'W') }

  describe '#execute' do
    let(:bitmap) { double.as_null_object }

    it 'takes a bitmap snapshot' do
      expect(bitmap).to receive(:take_snapshot)
      subject.execute(bitmap)
    end
  end
end

describe Rubit::CommandC do
  describe '#execute' do
    let(:bitmap) { double.as_null_object }

    it 'takes a bitmap snapshot' do
      expect(bitmap).to receive(:take_snapshot)
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
    let(:bitmap) { double.as_null_object }

    it 'colours a bitmap pixel' do
      expect(bitmap).to receive(:set_colour).with(column, row, colour)
      subject.execute(bitmap)
    end

    it 'takes a bitmap snapshot' do
      expect(bitmap).to receive(:take_snapshot)
      subject.execute(bitmap)
    end
  end
end

describe Rubit::CommandI do
  describe '#execute' do
    let(:columns) { 5 }
    let(:rows) { 6 }
    subject { Rubit::CommandI.new(columns, rows) }

    context 'when there is a bitmap' do
      let(:bitmap) { double.as_null_object }

      it 'creates a bitmap' do
        expect(Rubit::Bitmap).to receive(:new).with(columns, rows)
        subject.execute(bitmap)
      end

      it 'takes a bitmap snapshot' do
        expect(bitmap).to receive(:take_snapshot)
        subject.execute(bitmap)
      end
    end

    context 'when no bitmap was created' do
      let(:bitmap) { nil }

      it 'does not take a snapshot' do
        expect(bitmap).to_not receive(:take_snapshot)
        subject.execute(bitmap)
      end
    end
  end
end

describe Rubit::CommandX do
  describe '#execute' do
    it 'returns nil' do
      bitmap = double
      expect(subject.execute(bitmap)).to eq(nil)
    end
  end
end
