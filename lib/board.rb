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
  end

  def grid
    @grid
  end

  def over?
  end
end
