# frozen_string_literal: true

require_relative '../ui'

module Commands
  class StartNewGame
    def initialize; end

    def execute
      UI.render_line
      UI.display_logo
      UI.render_line
      UI.empty_line
      column_count = UI.prompt_for_int('Enter the size of the board (NxN, minimum size is 3x3):', min: 3)
      max_black_holes = column_count * column_count - 1
      black_holes_count = UI.prompt_for_int("Enter the number of black holes (1 to #{max_black_holes}):", min: 1,
                                                                                                          max: max_black_holes)
      board = Board.new(column_count: column_count, black_holes_count: black_holes_count)
      GameMaster.place_black_holes(board)
      GameMaster.calculate_adjacent_black_holes(board)
      GameLoop.new(board).execute
    end
  end
end
