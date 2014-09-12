module Rubit
  class Bitmap
    attr_reader :columns_count, :rows_count, :pixels
    def initialize(columns_count, rows_count)
      @columns_count = columns_count
      @rows_count = rows_count
      @pixels = create_new_pixel_matrix
    end

    def create_new_pixel_matrix
      Array.new(@rows_count) { Array.new(@columns_count) { 0 }}
    end

    def to_s
      @pixels.map {|row| "#{row.join}\n"}.join 
    end
  end
end
