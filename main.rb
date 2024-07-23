# frozen_string_literal: true

require_relative 'commands/open_cell'
require_relative 'commands/reveal_all_cells'
require_relative 'commands/start_new_game'
require_relative 'queries/draw_board'
require_relative 'queries/game_over'
require_relative 'models/board'
require_relative 'models/cell'
require_relative 'game_master'
require_relative 'game_loop'

Commands::StartNewGame.new.execute
