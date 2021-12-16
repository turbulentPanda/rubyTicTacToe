class Player 
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end


end

class Game
  attr_accessor :board, :winning_positions, :winner, :remaining_moves
  attr_reader :player1, :player2

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

    @player1 = Player.new(get_player_name(1), get_player_marker(1))

    @player2 = Player.new(get_player_name(2), get_player_marker(2))


    @winner = ''

    @remaining_moves = 9

    play_game
  end

  def update_winning_positions(position, marker)
    self.winning_positions.each do |row|
      row.each_with_index do |column, column_index|
        row[column_index] = marker if column == position.to_i
      end
    end
  end

  def update_board(position, marker)
    board.sub!(position.to_s, marker)
  end

  def display_board
    puts board
  end

  def game_over?(player1, player2)
    (remaining_moves == 0 || is_there_a_winner?(player1, player2)) ? true : false
  end

  def is_there_a_winner?(player1, player2)
    player1_winning_array = Array.new(3, player1.marker)
    player2_winning_array = Array.new(3, player2.marker)

    if winning_positions.include?(player1_winning_array)
      self.winner = player1
      true
    elsif winning_positions.include?(player2_winning_array)
      self.winner = player2
      true
    else
      false
    end
  end

  def get_player_name(player_number)
    puts "Enter Player #{player_number}'s name: "
    player_name = gets.chomp
  end

  def get_player_marker(player_number)
    puts "Enter Player #{player_number}'s marker: "
    player_marker = gets.chomp
  end

  def play_game
    player_turn = 1
    display_board
    unavailable_positions = []
    until game_over?(player1, player2)
      if player_turn == 1
        puts "#{player1.name}, choose a position to place your marker: "
        position = gets.chomp
        until !unavailable_positions.include?(position)
          puts "That position is already taken. Please choose another: "
          position = gets.chomp
        end
        update_winning_positions(position, player1.marker)
        update_board(position, player1.marker)
        unavailable_positions << position
        player_turn = 2
      else
        puts "#{player2.name}, choose a position to place your marker: "
        position = gets.chomp
        until !unavailable_positions.include?(position)
          puts "That position is already taken. Please choose another: "
          position = gets.chomp
        end
        update_winning_positions(position, player2.marker)
        update_board(position, player2.marker)
        unavailable_positions << position
        player_turn = 1
      end
      display_board
      p winning_positions
      self.remaining_moves -= 1
    end
    
    if is_there_a_winner?(player1, player2)
      puts "The winner is #{winner.name}!"
    else
      puts "It's a draw!"
    end
  end


end

game1 = Game.new
