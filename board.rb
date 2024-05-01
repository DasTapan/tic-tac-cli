# frozen_string_literal: true

class Board
  def initialize
    @cells = { a1: nil, a2: nil, a3: nil, b1: nil, b2: nil, b3: nil, c1: nil, c2: nil,
               c3: nil }
    @winner = nil
    p 'board created'
  end

  def get_board
    @cells
  end

  def winner?
    @winner
  end
  
  def fill_cell(index, value)
    if !@cells[index].nil?
      p 'already filled..place it in other cell'
      raise StandardError
    else
      @cells[index] = value.symbol
      p "placed #{value.symbol} at #{index}"

    #   require 'pry-byebug';binding.pry
    
        if check_winner != "next turn..."
            p "game over, #{value.name} won"
            @winner = true
        end
    end
  end

  private

  def check_winner
    # diagnoal
    if @cells[:a1] == @cells[:b2] && @cells[:b2] == @cells[:c3] && @cells[:a1] != nil
      @cells[:a1]
    elsif @cells[:c1] == @cells[:b2] && @cells[:b2] == @cells[:a3] && @cells[:c1] != nil
      @cells[:c1]
    # horizontal
    elsif @cells[:a1] == @cells[:b1] && @cells[:b1] == @cells[:c1] && @cells[:a1] != nil
      @cells[:a1]
    elsif @cells[:a2] == @cells[:b2] && @cells[:b2] == @cells[:c2] && @cells[:a2] != nil
      @cells[:a2]
    elsif @cells[:a3] == @cells[:b3] && @cells[:b3] == @cells[:c3] && @cells[:a3] != nil
      @cells[:a3]
    # vertical
    elsif @cells[:a1] == @cells[:a2] && @cells[:a2] == @cells[:a3] && @cells[:a1] != nil
      @cells[:a1]
    elsif @cells[:b1] == @cells[:b2] && @cells[:b2] == @cells[:b3] && @cells[:b1] != nil
      @cells[:b1]
    elsif @cells[:c1] == @cells[:c2] && @cells[:c2] == @cells[:c3] && @cells[:c1] != nil
      @cells[:c1]
    else
      'next turn...'
    end
  end
end
