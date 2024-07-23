# frozen_string_literal: true

module GameMaster
  DIRECTIONS = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
  ].freeze

  def self.place_black_holes(board)
    black_holes_to_place = board.black_holes_count
    placed_holes = 0

    while placed_holes < black_holes_to_place
      row = rand(board.column_count)
      col = rand(board.column_count)
      cell = board.cells[row][col]

      unless cell.is_black_hole
        cell.is_black_hole = true
        placed_holes += 1
      end
    end
  end

  def self.calculate_adjacent_black_holes(board)
    board.cells.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        next if cell.is_black_hole

        DIRECTIONS.each do |dx, dy|
          new_row = row_idx + dx
          new_col = col_idx + dy
          if valid_position?(new_row, new_col, board.column_count) && board.cells[new_row][new_col].is_black_hole
            cell.black_holes_around_count += 1
          end
        end
      end
    end
  end

  def self.valid_position?(row, col, column_count)
    row >= 0 && col >= 0 && row < column_count && col < column_count
  end

  def self.parse_input(input)
    case input
    when /\A\[(\d+),\s*(\d+)\]\z/
      [Regexp.last_match(1).to_i, Regexp.last_match(2).to_i]
    when /\A(\d+),\s*(\d+)\z/
      [Regexp.last_match(1).to_i, Regexp.last_match(2).to_i]
    when /\A(\d+)\s+(\d+)\z/
      [Regexp.last_match(1).to_i, Regexp.last_match(2).to_i]
    when /\A(\d)(\d)\z/
      [Regexp.last_match(1).to_i, Regexp.last_match(2).to_i]
    else
      UI.display_message('Invalid input format. Please try again.')
      parse_input(UI.prompt("Enter cell coordinates (e.g., '1,2'):"))
    end
  end
end
