module Rubit
  class Bitmap
    attr_accessor :columns_count, :rows_count, :pixels

    def initialize(columns_count, rows_count)
      @columns_count = columns_count
      @rows_count = rows_count
      @pixels = create_new_pixel_matrix
    end

    def create_new_pixel_matrix
      Array.new(@rows_count) { Array.new(@columns_count) { 0 } }
    end

    def set_colour(column, row, colour)
      @pixels[row - 1][column - 1] = colour
    end

    def get_colour(column, row)
      @pixels[row - 1][column - 1] 
    end

    def fill(x, y, new_colour, old_colour)
      current_colour = get_colour(x, y)
      if (x > 0 && x <= @columns_count &&
          y > 0 && y <= @rows_count &&
          current_colour == old_colour &&
          current_colour != new_colour)
        set_colour(x, y, new_colour)
        fill(x + 1, y, new_colour, old_colour)
        fill(x - 1, y, new_colour, old_colour)
        fill(x, y + 1, new_colour, old_colour)
        fill(x, y - 1, new_colour, old_colour)
      end
    end

    def draw_horizontal_segment(x1, x2, row, colour)
      (x1..x2).each do |column|
        set_colour(column, row, colour)
      end
    end

    def draw_vertical_segment(column, y1, y2, colour)
      (y1..y2).each do |row|
        set_colour(column, row, colour)
      end
    end

    def clear
      @pixels = create_new_pixel_matrix
    end

    def to_s
      @pixels.map {|row| "#{row.join}\n"}.join 
    end
  end
end

