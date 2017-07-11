require 'colorize'
require_relative 'board'
require_relative 'cursor'
require 'byebug'

class Display
  attr_reader :board, :rendered_board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end


  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."

    @rendered_board = ""
    @board.grid.each_with_index do |row, idx1|

      rendered_row = ""
      row.each_with_index do |col, idx2|
          if [idx1, idx2] == @cursor.cursor_pos
            rendered_row += "#{col}".colorize(:light_blue)
          else
            rendered_row += "#{col}"
          end

        #end

      end

      @rendered_board += rendered_row + "\n"
    end

    puts @rendered_board
  end


end


board1 = Board.new
game1 = Display.new(board1)



while true
  puts game1.render
  game1.cursor.get_input
end
