require_relative 'board'
require 'byebug'

class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark
  def initialize(name, mark = :O)
    @name = name
    @mark = mark
  end

  def display(board)
    @board = board
  end

  def get_move
    if winning_move
      winning_move
    else
      pos0 = rand(3)
      pos1 = rand(3)
      until board.grid[pos0][pos1] != nil
        pos0 = rand(3)
        pos1 = rand(3)
        return [pos0,pos1]
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
      if (combination.select { |pos| board.grid[pos[0]][pos[1]] == mark }).count == 2
        return (combination.select { |pos| board.grid[pos[0]][pos[1]] == nil }).flatten
      end
    end
    return nil
  end
end
