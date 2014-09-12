module Rubit
  class CLI
    def initialize(input=$stdin, output=$stdout)
      @input = input
      @output = output
    end

    def start
      while command_input = get_command_input
        command = CommandParser.parse(command_input)
        command.execute
        break if command.terminate
      end
    end

    def get_command_input
      @input.gets
    end
  end

end
