class Person 
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Game
  attr_accessor :board

  def initialize
    @board = "
      + - - + - - + - - +
      |  1  |  2  |  3  |
      + - - + - - + - - +
      |  4  |  5  |  6  |
      + - - + - - + - - +
      |  7  |  8  |  9  |
      + - - + - - + - - +
    "
  end

  def update_board(position, marker)
    @board.sub!(position.to_s, marker)
  end

  def display_board
    puts @board
  end
end

game1 = Game.new
game1.display_board
game1.update_board(5, "X")
game1.display_board



