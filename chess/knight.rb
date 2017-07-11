require_relative 'piece'

class Knight < Piece
  include SteppingPiece



  def initialize
  end

  def self.valid_moves(start_pos)
    valid_moves = []
    move_range = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    move_range.each do |move|
      x, y = move
      new_move = [@current_position[0] + x, @current_position[1] + y]
      valid_moves << new_move
    end

    valid_moves.reject do |move|
      move.any? { |num| num < 0 || num > 7 }
    end

  end
end
