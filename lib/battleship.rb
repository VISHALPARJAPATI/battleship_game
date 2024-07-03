# battleship.rb
require_relative 'player'

module Battleship
  module_function

  INPUT_FILE_PATH = File.expand_path('../../input.txt', __FILE__) # Adjusts the path to the root directory
  OUTPUT_FILE_PATH = File.expand_path('../../output.txt', __FILE__) # give us absolute(full path) of file not the relative

  # Note: File.expand_path ==> Converts the combined path to an absolute path..

  def game_start
    grid_size, total_ships, player_1_position, player_2_position, total_missiles, player_1_moves, player_2_moves = read_input

    begin
      player_1 = Player.new(grid_size, total_ships, total_missiles)
      player_2 = Player.new(grid_size, total_ships, total_missiles)

      player_1.set_grid
      player_2.set_grid

      player_1.place_ships_on_grid(player_1_position)
      player_2.place_ships_on_grid(player_2_position)

      player_1.attack_on(player_2, player_1_moves)
      player_2.attack_on(player_1, player_2_moves)

      write_output(player_1, player_2)
    rescue StandardError => e
      puts e.message
    end
  end

  def read_input
    lines = File.read(INPUT_FILE_PATH).split("\n")
    raise "Input file should have 7 lines" unless lines.size == 7

    lines
  end

  def write_output(player_1, player_2)
    File.open(OUTPUT_FILE_PATH, 'w') do |file|
      file.puts "Player1"
      display_grid(file, player_1)
      file.puts "Player2"
      display_grid(file, player_2)
      file.puts "P1:#{player_1.total_hits(player_2)}"
      file.puts "P2:#{player_2.total_hits(player_1)}"
      file.puts final_result(player_1, player_2)
    end
  end

  def display_grid(file, player)
    player.grid.each { |row| file.puts row.join(" ") }
  end

  def final_result(player_1, player_2)
    p1_hits = player_1.total_hits(player_2)
    p2_hits = player_2.total_hits(player_1)

    if p1_hits > p2_hits
      "Player 1 wins"
    elsif p2_hits > p1_hits
      "Player 2 wins"
    else
      "It is a draw"
    end
  end
end
