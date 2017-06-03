require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :board, :player_one, :player_two
  def initialize(player_one,player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def board
    board = Board.new
    board.grid 
  end

  def play_turn

  end

  def current_player
  end

end
