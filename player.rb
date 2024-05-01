# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    self.name = name
    self.symbol = symbol
    p 'player created'
  end

  private
  attr_writer :name, :symbol
end
