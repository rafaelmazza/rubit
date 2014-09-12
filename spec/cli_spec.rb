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
  end
end

# class InputMock 
#   attr_reader :inputs
#
#   def initialize
#     @inputs = []
#   end
#
#   def <<(input)
#     @inputs << input
#   end
#
#   def gets
#     @inputs.shift
#   end
# end
#
