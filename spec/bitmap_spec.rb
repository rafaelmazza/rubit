require 'spec_helper'

describe Rubit::Bitmap do
  let(:columns) { 5 }
  let(:rows)    { 6 }
  let(:empty_pixel_matrix) { Array.new(rows) { Array.new(columns) { 0 } } }
  subject { Rubit::Bitmap.new(columns, rows) }

  describe '#initialize' do
    it 'initializes columns and rows' do
      expect(subject.columns_count).to eq(5)
      expect(subject.rows_count).to eq(6)
    end
  end

  describe '#create_new_pixel_matrix' do
    it 'creates a matrix with defines columns and rows' do
      # empty_matrix = Array.new(rows) { Array.new(columns) { 0 }}
      expect(subject.create_new_pixel_matrix).to eq(empty_pixel_matrix)
    end
  end
  
  describe '#to_s' do
    it 'prints the pixel matrix on screen' do
      expect(subject.to_s).to eq("00000\n00000\n00000\n00000\n00000\n00000\n")
    end
  end

  describe '#set_colour' do
    it 'sets pixel colour using one-based indexing' do
      # 0  0  0
      # 0  0  0
      subject.pixels = [[0, 0,0], [0, 0, 0]]
      column, row = 3, 2
      subject.set_colour(column, row, 'A')
      expect(subject.get_colour(column, row)).to eq('A')
    end
  end

  describe '#get_colour' do
    it 'gets pixel colour using one-based indexing' do
      # 0  0  0
      # 0  0 'A'
      subject.pixels = [[0, 0, 0], [0, 0, 'A']]
      column, row = 3, 2
      expect(subject.get_colour(column, row)).to eq('A')
    end
  end

  describe '#clear' do
    it 'clear the pixel matrix' do
      subject.set_colour(1, 1, 'A')
      subject.clear
      expect(subject.pixels).to eq(empty_pixel_matrix)
    end
  end

end
