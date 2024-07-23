# frozen_string_literal: true

require_relative 'ui'

class GameLoop
  def initialize(board)
    @board = board
  end

  def execute
    loop do
      Queries::DrawBoard.new(@board).execute
      input = UI.prompt("Choose a cell to open (e.g., '1,2', '1 2', '12', or '[1, 2]', or type 'exit' to end the game):")
      break if input.downcase == 'exit'

      row, col = GameMaster.parse_input(input)
      if Validator.valid_position?(row - 1, col - 1, @board.column_count)
        Commands::OpenCell.new(@board, row - 1, col - 1).execute
        break if Queries::GameOver.new(@board).execute
      else
        UI.display_message('Invalid input. Please enter valid row and column numbers.')
      end
    end
  end

  def play_again?
    UI.prompt('Do you want to play again? (y/n)').downcase == 'y'
  end
end
