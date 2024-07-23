# frozen_string_literal: true

require 'rspec'
require_relative '../spec_helper'

RSpec.describe Commands::OpenCell do
  let(:board) { Board.new(column_count: 3, black_holes_count: 1) }
  let(:command) { described_class.new(board, 1, 1) }

  it 'executes without errors' do
    expect { command.execute }.not_to raise_error
  end

  it 'opens the cell' do
    command.execute
    expect(board.cells[1][1].is_open).to be true
  end
end
