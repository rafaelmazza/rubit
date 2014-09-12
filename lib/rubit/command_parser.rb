module Rubit

  class CommandParser
    def self.parse(command_input)
      command_name = command_input.split.first
      Object.const_get("Rubit::Command#{command_name}").new
    end
  end

  class Command
    attr_reader :terminate
  end

  class CommandX < Command
    def execute
      puts 'Bye!'
      @terminate = true
    end
  end

end
