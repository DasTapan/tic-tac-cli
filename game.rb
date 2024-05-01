# frozen_string_literal: true

require './board'
require './player'

class Game
  def initialize(player1, _player2)
    @player1 = player1
    @player2 = _player2
    @board = Board.new
    @valid_player = player1
    p 'game session created'
    print_board
  end

  def start_game
    # require 'pry-byebug';binding.pry

    while !@board.winner?
      begin
        p "#{@valid_player.name}, select an empty cell"
        col = gets.chomp
        row = gets.chomp
        place(col, row)
      rescue StandardError => e
        puts "\tCaught: #{e}"
        retry
      else
        if @valid_player == @player1
            @valid_player = @player2
        else
            @valid_player = @player1
        end
      end
    end
  end

  private

  def place(col, row)
    cell = "#{col}#{row}".to_sym
    @board.fill_cell(cell, @valid_player)
    print_board
  end
  
  def print_board
    cells = @board.get_board
    puts '   a   b   c'
    puts "1  #{cells[:a1]} | #{cells[:b1]} | #{cells[:c1]} "
    puts ' ---+---+---'
    puts "2  #{cells[:a2]} | #{cells[:b2]} | #{cells[:c2]} "
    puts ' ---+---+---'
    puts "3  #{cells[:a3]} | #{cells[:b3]} | #{cells[:c3]} "
  end
end

game = Game.new(Player.new('raja', 'X'), Player.new('rani', 'O'))
game.start_game
