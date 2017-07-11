require 'singleton'

class Piece
  attr_reader :current_position, :board, :team

  def initialize(team)
    @team = team
  end

  def moves

  end

  def to_s
    "X".colorize(@team)
  end



end

class NullPiece < Piece
  include Singleton
  def initialize
  end

  def to_s
    "O"
  end
end

#Bishop/Rook/Queen
module SlidingPiece
  def move_dirs
  end

  def moves
  end
end

#Knight / King
module SteppingPiece
  def moves

  end
end
