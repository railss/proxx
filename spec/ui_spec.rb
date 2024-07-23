# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'

RSpec.describe Queries::DrawBoard do
  let(:board) { Board.new(column_count: 3, black_holes_count: 1) }
  let(:query) { described_class.new(board) }

  it 'executes without errors' do
    expect { query.execute }.not_to raise_error
  end
end
