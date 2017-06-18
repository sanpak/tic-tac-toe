require_relative 'board'
require 'byebug'

class ComputerPlayer
  attr_accessor :name, :board
  attr_accessor :mark
  def initialize(name, mark = :O)
    @name = name
    @mark = mark
  end

  def display(board)
    @board = board
    puts ""
    puts " #{@board.grid[0][0]} | #{@board.grid[0][1]} | #{@board.grid[0][2]} "
    puts "_________"
    puts " #{@board.grid[1][0]} | #{@board.grid[1][1]} | #{@board.grid[1][2]} "
    puts "_________"
    puts " #{@board.grid[2][0]} | #{@board.grid[2][1]} | #{@board.grid[2][2]} "
    puts ""
  end

  def get_move
    # debugger
    if winning_move
      winning_move
    else
      pos0 = rand(3)
      pos1 = rand(3)
      while @board.empty?([pos0,pos1]) && @board.grid[pos0][pos1] == :X
        pos0 = rand(3)
        pos1 = rand(3)
        # return [pos0,pos1]
      end
      return [pos0,pos1]
    end
  end

  def winning_move
    get_win_moves = []
    win_moves = [
      [[0,0],[0,1],[0,2]], #top row
      [[1,0],[1,1],[1,2]], #second row
      [[2,0],[2,1],[2,2]], #thrid row
      [[0,0],[1,1],[2,2]], #left diagonal
      [[0,1],[1,1],[2,1]], #second col
      [[0,2],[1,1],[2,0]], #right diagonal
      [[0,0],[1,0],[2,0]], #First col
      [[0,2],[1,2],[2,2]]  #third col
    ]
    win_moves.each do |combination|
      # debugger
      if (combination.select { |pos| @board.grid[pos[0]][pos[1]] == :O && combination.all? { |el| @board.grid[el[0]][el[1]] != :X } }).count == 2
        return (combination.select { |pos| @board.grid[pos[0]][pos[1]] == nil }).flatten
      end
    end
    return nil
  end
end
