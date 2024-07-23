# frozen_string_literal: true

module Queries
  class DrawBoard
    def initialize(board)
      @board = board
    end

    def execute
      print '  '
      (1..@board.column_count).each { |i| print "#{i} " }
      puts

      @board.cells.each_with_index do |row, idx|
        print "#{idx + 1} "
        row.each do |cell|
          if cell.is_open
            print cell.is_black_hole ? 'H ' : "#{cell.black_holes_around_count} "
          else
            print '* '
          end
        end
        puts
      end
    end
  end
end
