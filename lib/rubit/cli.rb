module Rubit
  class CLI
    attr_reader :bitmap
    def initialize(input=$stdin, output=$stdout)
      @input = input
      @output = output
    end

    def start
      puts "-------------------------------"
      puts "Basic Interactive Bitmap Editor"
      puts "-------------------------------"
      while command_input = get_command_input
        begin
          command = CommandParser.parse(command_input)
          @bitmap = command.execute(@bitmap)
          break if @bitmap.nil?
        rescue NoMethodError => error
          @output.puts 'No bitmap created yet.'
        rescue NameError => error
          @output.puts 'Command not found.'
        rescue ArgumentError => error
          @output.puts 'Wrong command usage. Please, check the README for help.'
        rescue OutOfRange => error
          @output.puts 'Rows/columns out of allowed range.'
        end
      end
    end

    def get_command_input
      @output.print "# "
      @input.gets
    end
  end

end
