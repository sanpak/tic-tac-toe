class Board
  attr_reader :grid

  def initialize(grid = nil)
    grid = [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]] if grid == nil
    @grid = grid
  end

  def place_mark(pos,mark)
    grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    return true unless grid[pos[0]][pos[1]]
  end

  def winner
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
      return :X if combination.all? { |el| grid[el[0]][el[1]] == :X }
      return :O if combination.all? { |el| grid[el[0]][el[1]] == :O }
    end
    return nil
  end

  def grid
    @grid
  end

  def over?
    return true if winner == :X || winner == :O || grid.all? { |el| el.include?(:X) || el.include?(:O) }
  end
end
