# frozen_string_literal: true

module Validator
  def self.valid_integer?(input, min: nil, max: nil)
    return false unless input.match?(/^\d+$/)

    num = input.to_i
    return false if min && num < min
    return false if max && num > max

    true
  end

  def self.valid_position?(row, col, column_count)
    row >= 0 && col >= 0 && row < column_count && col < column_count
  end
end
