module Rubit
  class CLI
    attr_reader :bitmap
    def initialize(input=$stdin, output=$stdout)
      @input = input
      @output = output
    end

    def start
      while command_input = get_command_input
        command = CommandParser.parse(command_input)
        @bitmap = command.execute(@bitmap)
        break if command.terminate
      end
    end

    def get_command_input
      @input.gets
    end
  end

end
