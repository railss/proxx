# frozen_string_literal: true

require_relative '../commands/reveal_all_cells'
require_relative '../ui'

module Queries
  class GameOver
    def initialize(board)
      @board = board
    end

    def execute
      all_cells_open_or_bombs = @board.cells.flatten.all? { |cell| cell.is_open || cell.is_black_hole }
      Commands::RevealAllCells.new(@board).execute if all_cells_open_or_bombs
      all_cells_open_or_bombs
    end
  end
end
