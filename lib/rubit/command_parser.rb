module Rubit

  class CommandParser
    def self.parse(command_input)
      command_args = command_input.split.map {|arg| arg.match(/^(\d)+$/) ? arg.to_i : arg}
      command_name = command_args.shift
      Object.const_get("Rubit::Command#{command_name}").new(*command_args)
    end
  end

  class Command
  end

  class CommandU < Command
    def execute(bitmap)
      bitmap.undo
      bitmap
    end
  end

  class CommandC < Command
    def execute(bitmap)
      bitmap.take_snapshot
      bitmap.clear
      bitmap
    end
  end

  class CommandF < Command
    def initialize(x, y, colour)
      @x, @y, @colour = x, y, colour
    end
    def execute(bitmap)
      bitmap.take_snapshot
      @old_colour = bitmap.get_colour(@x, @y)
      bitmap.fill(@x, @y, @colour, @old_colour)
      bitmap
    end
  end

  class CommandH < Command
    def initialize(x1, x2, row, colour)
      @x1, @x2, @row, @colour = x1, x2, row, colour
    end
    def execute(bitmap)
      bitmap.take_snapshot
      bitmap.draw_horizontal_segment(@x1, @x2, @row, @colour)
      bitmap
    end
  end

  class CommandV < Command
    def initialize(column, y1, y2, colour)
      @column, @y1, @y2, @colour = column, y1, y2, colour
    end
    def execute(bitmap)
      bitmap.take_snapshot
      bitmap.draw_vertical_segment(@column, @y1, @y2, @colour)
      bitmap
    end
  end

  class CommandL < Command
    def initialize(column, row, colour)
      @column, @row, @colour = column, row, colour
    end
    def execute(bitmap)
      bitmap.take_snapshot
      bitmap.set_colour(@column, @row, @colour)
      bitmap
    end
  end

  class CommandI < Command
    def initialize(columns, rows)
      @columns, @rows = columns, rows
    end
    def execute(bitmap)
      bitmap.take_snapshot unless bitmap.nil?
      bitmap = Rubit::Bitmap.new(@columns, @rows)
      bitmap
    end
  end

  class CommandS < Command
    def execute(bitmap)
      bitmap.show
      bitmap
    end
  end

  class CommandX < Command
    def execute(bitmap)
      puts 'Bye!'
      nil
    end
  end

end
