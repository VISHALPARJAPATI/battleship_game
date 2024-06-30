# player.rb

class Player

  attr_reader :grid

  GRID_RANGE = 1..9

  def initialize(grid_size, total_ships, total_missiles)
    @grid_size = grid_size.to_i
    @total_ships = total_ships.to_i
    @total_missiles = total_missiles.to_i

    validate_initial_inputs
  end

  def set_grid
    @grid = Array.new(@grid_size) { Array.new(@grid_size, "_") }
  end

  def place_ships_on_grid(positions)
    position_arr = positions.split(":")
    raise "There should be #{@total_ships} positions" unless position_arr.count == @total_ships

    position_arr.each do |position|
      x_axis, y_axis = position.split(",").map(&:to_i)
      @grid[x_axis][y_axis] = "B"
    end
  end

  def attack_on(opponent, moves)
    moves_arr = moves.split(":")
    raise "There should be #{@total_missiles} moves" unless moves_arr.count == @total_missiles

    moves_arr.each do |move|
      x_axis, y_axis = move.split(",").map(&:to_i)

      if opponent.grid[x_axis][y_axis] == "B"
        opponent.grid[x_axis][y_axis] = "X"
      else
        opponent.grid[x_axis][y_axis] = "O"
      end
    end
  end

  def total_hits(opponent)
    opponent.grid.flatten.count("X")
  end

  private

  def validate_initial_inputs
    validate_grid_size
    validate_total_ships
  end

  def validate_grid_size
    raise "Grid size should be in between #{GRID_RANGE}" unless GRID_RANGE.include?(@grid_size)
  end

  def validate_total_ships
    max_ships = @grid_size.pow(2) / 2
    raise "Total ships should be in between 1 to #{max_ships}" unless (1..max_ships).include?(@total_ships)
  end
end
