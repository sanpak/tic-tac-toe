require 'byebug'

class HumanPlayer
  attr_reader :name, :mark
  def initialize(name,mark = :X)
    @name = name
    @mark = mark
  end

  def get_move
    puts "where"
    move = gets.chomp.split(",")
    move = move.map { |el| el.to_i }
  end

  def display(board)
    puts ""
    puts " #{board.grid[0][0]} | #{board.grid[0][1]} | #{board.grid[0][2]} "
    puts "_________"
    puts " #{board.grid[1][0]} | #{board.grid[1][1]} | #{board.grid[1][2]} "
    puts "_________"
    puts " #{board.grid[2][0]} | #{board.grid[2][1]} | #{board.grid[2][2]} "
    puts ""
  end
end
