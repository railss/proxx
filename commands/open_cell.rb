# frozen_string_literal: true

require_relative '../ui'

module Commands
  class OpenCell
    def initialize(board, row, col)
      @board = board
      @row = row
      @col = col
    end

    def execute
      if @board.cells[@row][@col].is_black_hole
        UI.display_message('You hit a black hole!')
        Commands::RevealAllCells.new(@board).execute
        Queries::DrawBoard.new(@board).execute
        UI.display_message('Game over!')
        Commands::StartNewGame.new.execute if GameLoop.new(@board).play_again?
      else
        @board.reveal_near_non_black_holes_cell(@row, @col)
        if Queries::GameOver.new(@board).execute
          UI.display_message('You win!')
          Queries::DrawBoard.new(@board).execute
          Commands::StartNewGame.new.execute if GameLoop.new(@board).play_again?
        end
      end
    end
  end
end
