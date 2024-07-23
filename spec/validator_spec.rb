# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'

RSpec.describe Validator do
  it 'validates integer correctly' do
    expect(described_class.valid_integer?('5', min: 1, max: 10)).to be true
    expect(described_class.valid_integer?('0', min: 1, max: 10)).to be false
    expect(described_class.valid_integer?('11', min: 1, max: 10)).to be false
  end

  it 'validates position correctly' do
    expect(described_class.valid_position?(0, 0, 3)).to be true
    expect(described_class.valid_position?(-1, 0, 3)).to be false
  end
end
