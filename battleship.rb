require_relative "player"

module Battleship
  module_function

  def game_start
    file_path = "input.txt"

    # Read the file content and split it by newlines
    lines = File.read(file_path).split("\n")

    # Assign variables from the split lines
    grid_size, total_ships, player_1_position, player_2_position, total_missiles, player_1_moves, player_2_moves = lines

    player_1 = Player.new(grid_size.to_i, total_ships.to_i)
    player_2 = Player.new(grid_size.to_i, total_ships.to_i)

    player_1.place_ships_on_grid(player_1_position)
    player_2.place_ships_on_grid(player_2_position)

    player_1.attack_on(player_2, player_1_moves)
    player_2.attack_on(player_1, player_2_moves)

    result(player_1, player_2)
  end

  def result player_1, player_2
    file_path = "output.txt"

    unless File.exist?(file_path)
      File.open(file_path, 'w') do |file|
        file.puts "Player1"
        display_grid(file, player_1)
        file.puts "Player2"
        display_grid(file, player_2)
        file.puts "P1:#{player_1.total_hits(player_2)}"
        file.puts "P2:#{player_2.total_hits(player_1)}"
        file.puts final_result(player_1, player_2)
      end
    end
  end

  def display_grid file, player
    player.grid.each do |row|
      file.puts row.join(",").gsub(",", " ")
    end
  end

  def final_result player_1, player_2
    if player_1.total_hits(player_2) > player_2.total_hits(player_1)
      "Player 1 won"
    elsif player_2.total_hits(player_1) > player_1.total_hits(player_2)
      "Player 2 won"
    else
      "It is a draw"
    end
  end
end

# >>>>>>>>>>>> Let's start
Battleship.game_start
