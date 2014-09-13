module Rubit
  class CLI
    attr_reader :bitmap
    def initialize(input=$stdin, output=$stdout)
      @input = input
      @output = output
    end

    def start
      while command_input = get_command_input
        begin
          command = CommandParser.parse(command_input)
          @bitmap = command.execute(@bitmap)
          break if command.terminate
        rescue NoMethodError => error
          @output.puts 'No bitmap created yet.'
        rescue NameError => error
          @output.puts 'Command not found.'
        rescue ArgumentError => error
          @output.puts 'Wrong command usage. Please, check the README for help.'
        end
      end
    end

    def get_command_input
      @input.gets
    end
  end

end
