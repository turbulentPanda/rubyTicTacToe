class Person 
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Game
  attr_accessor :board, :winning_positions

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

    @winning_positions = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]
  end

  def update_winning_positions(position, marker)
    winning_positions.each do |row|
      row.each_with_index do |column, column_index|
        row[column_index] = marker if column == position
      end
    end
  end

  def update_board(position, marker)
    board.sub!(position.to_s, marker)
  end

  def display_board
    puts board
  end
end

game1 = Game.new
# game1.display_board
game1.update_winning_positions(1, "X")
game1.update_winning_positions(2, "X")
game1.update_winning_positions(3, "X")
p game1.winning_positions
# game1.update_board(5, "X")
# game1.display_board



