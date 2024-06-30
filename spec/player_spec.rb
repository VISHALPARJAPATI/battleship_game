# spec player_spec.rb
require 'spec_helper'
require 'player'

RSpec.describe Player do
  let(:grid_size) { 5 }
  let(:total_ships) { 5 }
  let(:total_missiles) { 5 }
  let(:player) { Player.new(5, 5, 5) }

  describe "#initialize" do
    it "initialize with correct attributes" do
      expect(player.instance_variable_get(:@grid_size)).to eq(grid_size)
      expect(player.instance_variable_get(:@total_ships)).to eq(total_ships)
      expect(player.instance_variable_get(:@total_missiles)).to eq(total_missiles)
    end
  end

  describe "#set_grid" do
    it "sets up a grid with correct size" do
      player.set_grid

      expect(player.grid.size).to eq(grid_size)
      expect(player.grid.all? { |row| row.size == grid_size }).to be true
    end
  end

  describe "#place_ship_on_grid" do
    # for below mentioned 2 cases, this before block will work
    before do
      player.set_grid
      player.place_ships_on_grid("1,1:2,0:2,3:3,4:4,3")
    end

    it "places ships on the grid" do
      expect(player.grid[1][1]).to eq("B")
      expect(player.grid[2][0]).to eq("B")
      expect(player.grid[2][3]).to eq("B")
      expect(player.grid[3][4]).to eq("B")
      expect(player.grid[4][3]).to eq("B")
    end

    it "keeps others places empty" do
      expect(player.grid[0][0]).to eq("_")
    end
  end

  describe "#attack_on_opponent" do
    let(:opponent) { Player.new(grid_size, total_ships, total_missiles) }

    before do
      opponent.set_grid
      opponent.place_ships_on_grid("0,1:2,3:3,0:3,4:4,1")
    end

    it "registers hits on opponent grid" do
      player.attack_on(opponent, "0,1:4,3:2,3:3,1:4,1")

      expect(opponent.grid[0][1]).to eq("X")
      expect(opponent.grid[2][3]).to eq("X")
      expect(opponent.grid[4][1]).to eq("X")
    end

    it "registers misses on opponent grid" do
      player.attack_on(opponent, "0,1:4,3:2,3:3,1:4,1")

      expect(opponent.grid[4][3]).to eq("O")
      expect(opponent.grid[3][1]).to eq("O")
    end
  end

  describe "#total_hits" do
    let(:opponent) { Player.new(grid_size, total_ships, total_missiles) }

    before do
      opponent.set_grid
      opponent.place_ships_on_grid("0,1:2,3:3,0:3,4:4,1")
      player.attack_on(opponent, "0,1:4,3:2,3:3,1:4,1")
    end

    it "calculates hits on the opponent" do
      expect(player.total_hits(opponent)).to eq(3)
    end
  end
end
