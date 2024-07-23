# frozen_string_literal: true

class Cell
  attr_accessor :is_black_hole, :black_holes_around_count, :is_open

  def initialize
    @is_black_hole = false
    @black_holes_around_count = 0
    @is_open = false
  end

  def open_cell
    @is_open = true
  end
end
