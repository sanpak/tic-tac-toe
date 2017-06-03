require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :player_one, :player_two, :current_player
  def initialize(player_one = HumanPlayer.new,player_two = ComputerPlayer.new)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current_player = player_one
  end

  def play_turn
    move = @current_player.get_move
    board.place_mark(move,:X)
    switch_players!
  end


  def switch_players!
    @current_player = player_two
  end

end
