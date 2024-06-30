class Player
  attr_reader :grid

  def initialize(grid_size, total_ships)
    @grid_size = grid_size
    @total_ships = total_ships
    @grid = Array.new(grid_size) { Array.new(grid_size, "_") }
  end

  def place_ships_on_grid positions
    position_arr = positions.split(":")
    # create a exception class and raise error if
    # position array is not equals to total ships
    position_arr.each do |position|
      x_axis = position.split(",")[0].to_i
      y_axis = position.split(",")[1].to_i

      grid[x_axis][y_axis] = "B"
    end
  end

  def attack_on(opponent, moves)
    moves_arr = moves.split(":")
    # create a exception class and raise error if
    # moves_arr array is not equals to total missile
    moves_arr.each do |move|
      x_axis = move.split(",")[0].to_i
      y_axis = move.split(",")[1].to_i

      if opponent.grid[x_axis][y_axis] == "B"
        opponent.grid[x_axis][y_axis] = "X"
      else
        opponent.grid[x_axis][y_axis] = "O"
      end
    end
  end

  def total_hits(opponent)
    hits = 0
    opponent.grid.each do |rows|
      hits += rows.count { |row| row.to_s == "X" }
    end

    hits
  end
end
