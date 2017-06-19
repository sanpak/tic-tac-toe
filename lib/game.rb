require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require 'byebug'

class Game
  attr_accessor :board, :player_one, :player_two, :current_player
  def initialize(player_one = HumanPlayer.new("John"),player_two = ComputerPlayer.new("Peter"))
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current_player = player_one
  end

  def play_turn
    # debugger
    move = @current_player.get_move
    #In a game situation, can't allow human players to mark the ":O" position
    # while @board.grid[move[0]][move[1]] != nil
    #   puts "Invalid move"
    #   move = @current_player.get_move
    # end
    @board.place_mark(move,@current_player.mark)
    switch_players!
  end


  def switch_players!
    # debugger
    if @current_player == player_one
      @current_player = player_two
    else
      @current_player = player_one
    end
  end

  def play
    until @board.over?
      play_turn
      @current_player.display(@board)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
