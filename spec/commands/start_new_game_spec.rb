# frozen_string_literal: true

require 'rspec'
require_relative '../spec_helper'

RSpec.describe Commands::StartNewGame do
  it 'executes without errors' do
    allow(UI).to receive(:prompt_for_int).and_return(3)
    allow(UI).to receive(:prompt).and_return('exit')  # Mock input to exit immediately

    expect { described_class.new.execute }.not_to raise_error
  end
end
