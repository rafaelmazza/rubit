module Rubit

  class CommandParser
    def self.parse(command_input)
      command_args = command_input.split.map {|arg| arg.match(/^(\d)+$/) ? arg.to_i : arg}
      command_name = command_args.shift
      Object.const_get("Rubit::Command#{command_name}").new(*command_args)
    end
  end

  class Command
    attr_reader :terminate
  end

  class CommandI < Command
    def initialize(columns, rows)
      @columns, @rows = columns, rows
    end
    def execute
      puts Rubit::Bitmap.new(@columns, @rows)
    end
  end

  class CommandX < Command
    def execute
      puts 'Bye!'
      @terminate = true
    end
  end

end
