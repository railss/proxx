# frozen_string_literal: true

class Board
  attr_reader :column_count, :black_holes_count, :cells

  def initialize(column_count:, black_holes_count:)
    @column_count = column_count
    @black_holes_count = black_holes_count
    @cells = Array.new(column_count) { Array.new(column_count) { Cell.new } }
  end

  def reveal_near_non_black_holes_cell(row, col)
    return if !GameMaster.valid_position?(row, col, column_count) || @cells[row][col].is_open

    @cells[row][col].open_cell

    return if @cells[row][col].black_holes_around_count.positive?

    cells_to_open = case column_count
                    when 3 then 2
                    when 4, 5 then 3
                    when 6..10 then 5
                    else
                      1
                    end

    cells_opened = 0
    GameMaster::DIRECTIONS.shuffle.each do |dx, dy|
      break if cells_opened >= cells_to_open

      new_row = row + dx
      new_col = col + dy
      if GameMaster.valid_position?(new_row, new_col, column_count) && !@cells[new_row][new_col].is_open
        @cells[new_row][new_col].open_cell
        cells_opened += 1
      end
    end
  end
end
