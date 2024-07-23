# frozen_string_literal: true

require 'rspec'
require_relative '../spec_helper'

RSpec.describe Commands::RevealAllCells do
  let(:board) { Board.new(column_count: 3, black_holes_count: 1) }
  let(:command) { described_class.new(board) }

  it 'executes without errors' do
    expect { command.execute }.not_to raise_error
  end

  it 'opens all cells' do
    command.execute
    expect(board.cells.flatten.all?(&:is_open)).to be true
  end
end
