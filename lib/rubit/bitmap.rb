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

    def clear
      puts 'aqui'
      puts create_new_pixel_matrix.inspect
      @pixels = create_new_pixel_matrix
    end

    def to_s
      @pixels.map {|row| "#{row.join}\n"}.join 
    end
  end
end
