require 'spec_helper'

describe Rubit::CommandParser do
  describe '.parse' do
    it 'instantiates a command class according to input command' do
      command_input = 'X'
      expect(Rubit::CommandX).to receive(:new)
      Rubit::CommandParser.parse(command_input)
    end
  end
end
