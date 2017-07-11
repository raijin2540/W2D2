require_relative 'piece'
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @grid[0].map! { |pos| pos = Piece.new(:red) }
    @grid[1].map! { |pos| pos = Piece.new(:red) }

    @grid[6].map! { |pos| pos = Piece.new(:green) }
    @grid[7].map! { |pos| pos = Piece.new(:green) }

    @grid[2].map! { |pos| pos = NullPiece.instance}
    @grid[3].map! { |pos| pos = NullPiece.instance}
    @grid[4].map! { |pos| pos = NullPiece.instance}
    @grid[5].map! { |pos| pos = NullPiece.instance}

  # (0..1).each do |row|
  #
  # (0..7).each do |col|
  #   self[row,col]
  # end

end

  end

  def move_piece(start_pos, end_pos)
    raise "Position is empty!" if self[start_pos].is_a?(NullPiece)

    raise "Invalid Move" if self[end_pos].is_a?(Piece)

    self[end_pos] = self[start_pos]

    self[start_pos] = NullPiece.instance

  end

  def in_bounds?(pos)
    pos.all? { |x| x >= 0 && x < 8}
  end

  def show_piece(start_pos)
    self[start_pos]
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

end
