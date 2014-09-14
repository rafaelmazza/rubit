require 'spec_helper'

describe Rubit::CLI do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  subject { Rubit::CLI.new(input, output) }

  describe '#start' do
    it 'gets command input' do
      expect(input).to receive(:gets)
      subject.start
    end

    context 'when no bitmap created yet' do
      let(:input) { StringIO.new("L 3 3 C") }

      it 'notifies the user' do
        subject.start
        expect(output.string).to match('No bitmap created yet.')
      end
    end

    context 'when command is not found' do
      let(:input) { StringIO.new("G 3 3 C") }
      it 'notifies the user' do
        subject.start
        expect(output.string).to match('Command not found.')
      end
    end

    context 'when command arguments are wrong' do
      let(:input) { StringIO.new("L 3 3") }
      it 'notifies the user' do
        subject.start
        expect(output.string).to match('Wrong command usage. Please, check the README for help.')
      end
    end

    context 'when columns (M) or rows (N) are out of allowed range (1 <= M, 1 <= N <= 250)' do
      let(:input) { StringIO.new("I 0 10") }

      it 'notifies the user' do
        subject.start
        expect(output.string).to match('Rows/columns out of allowed range.')
      end
    end
  end
end

