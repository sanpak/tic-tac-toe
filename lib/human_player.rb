class HumanPlayer
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def get_move
    puts "where"
    move = gets.chomp.split(",")
    move = move.map { |el| el.to_i }
  end

  def display(board)
    puts "#{board.grid}"
  end
end
