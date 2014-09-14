module Rubit
  class Bitmap
    attr_accessor :columns_count, :rows_count, :snapshots, :pixels
    # attr_reader :pixels

    def initialize(columns_count, rows_count)
      @columns_count = columns_count
      @rows_count = rows_count
      @pixels = create_new_pixel_matrix
      @snapshots = []
    end

    def create_new_pixel_matrix
      Array.new(@rows_count) { Array.new(@columns_count) { 0 } }
    end

    def set_colour(column, row, colour)
      @pixels[row - 1][column - 1] = colour unless out_of_bounds?(column, row)
    end

    def get_colour(column, row)
      @pixels[row - 1][column - 1] unless out_of_bounds?(column, row)
    end

    def out_of_bounds?(column, row)
      (row <= 0 || row > @rows_count) || (column <= 0 || column > @columns_count)
    end

    def fill(x, y, new_colour, old_colour)
      return if out_of_bounds?(x, y)
      return if old_colour == new_colour
      current_colour = get_colour(x, y)
      return if current_colour != old_colour
      set_colour(x, y, new_colour)
      fill(x + 1, y, new_colour, old_colour)
      fill(x - 1, y, new_colour, old_colour)
      fill(x, y + 1, new_colour, old_colour)
      fill(x, y - 1, new_colour, old_colour)
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

    def show
      puts self
    end

    def take_snapshot
      @snapshots << serialize(@pixels)
    end

    def undo
      @pixels = @snapshots.empty? ? nil : deserialize(@snapshots.pop)
    end

    def to_s
      @pixels.map {|row| "#{row.join}\n"}.join unless @pixels.nil?
    end

    private
    def serialize(pixels)
      Marshal.dump(pixels)
    end

    def deserialize(snapshot)
      Marshal.load(snapshot) unless snapshot.nil?
    end
  end
end

