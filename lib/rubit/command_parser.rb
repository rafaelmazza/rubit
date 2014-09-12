module Rubit

  class CommandParser
    def self.parse(command_input)
      command_args = command_input.split.map {|arg| arg.match(/^(\d)+$/) ? arg.to_i : arg}
      command_name = command_args.shift
      Object.const_get("Rubit::Command#{command_name}").new(*command_args)
    end
  end

  class Command
    attr_reader :terminate, :bitmap
  end

  class CommandC < Command
    def execute(bitmap)
      bitmap = bitmap.clear
      bitmap
    end
  end

  class CommandV < Command
    def initialize(column, y1, y2, colour)
      @column, @y1, @y2, @colour = column, y1, y2, colour
    end
    def execute(bitmap)
      bitmap.draw_vertical_segment(@column, @y1, @y2, @colour)
      bitmap
    end
  end

  class CommandL < Command
    def initialize(column, row, colour)
      @column, @row, @colour = column, row, colour
    end
    def execute(bitmap)
      bitmap.set_colour(@column, @row, @colour)
      bitmap
    end
  end

  class CommandI < Command
    def initialize(columns, rows)
      @columns, @rows = columns, rows
    end
    def execute(bitmap)
      bitmap = Rubit::Bitmap.new(@columns, @rows)
      bitmap
    end
  end

  class CommandS < Command
    def execute(bitmap)
      # puts 'aqui'
      # puts bitmap.inspect
      puts bitmap
      bitmap
    end
  end

  class CommandX < Command
    def execute(bitmap)
      puts 'Bye!'
      @terminate = true
    end
  end

end
