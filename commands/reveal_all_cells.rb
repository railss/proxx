# frozen_string_literal: true

module Commands
  class RevealAllCells
    def initialize(board)
      @board = board
    end

    def execute
      @board.cells.each do |row|
        row.each(&:open_cell)
      end
    end
  end
end
