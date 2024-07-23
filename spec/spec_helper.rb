# frozen_string_literal: true

# spec/spec_helper.rb

require 'rspec'
require_relative '../commands/open_cell'
require_relative '../commands/reveal_all_cells'
require_relative '../commands/start_new_game'
require_relative '../queries/draw_board'
require_relative '../queries/game_over'
require_relative '../models/board'
require_relative '../models/cell'
require_relative '../game_master'
require_relative '../game_loop'
require_relative '../ui'
require_relative '../validator'

RSpec.configure do |config|
  # Add additional requires below this line. Rails is not loaded until this point!

  # Start the configuration for RSpec
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.filter_run :focus
  # config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end
