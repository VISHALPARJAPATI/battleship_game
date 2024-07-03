# spec/battleship_spec.rb
require 'battleship'
require 'player'

RSpec.describe Battleship do
  describe '.read_input' do
    it 'reads the input file and returns an array of inputs' do
      # When the `read_input` method executes, it will not read the actual file from the specified input file path.
      # Instead, it will simulate reading the file and return the predefined content we have specified below.
      allow(File).to receive(:read).with(Battleship::INPUT_FILE_PATH).and_return("5\n5\n1,1:2,0:2,3:3,4:4,3\n0,1:2,3:3,0:3,4:4,1\n5\n0,1:4,3:2,3:3,1:4,1\n0,1:0,0:1,1:2,3:4")
      inputs = Battleship.read_input # this method , simulate to read the actual file and return the data that we defined above ....
      expect(inputs.size).to eq(7)
    end
  end

  describe '.write_output' do
    let(:player_1) { Player.new(5, 5, 5) }
    let(:player_2) { Player.new(5, 5, 5) }

    before do
      player_1.set_grid
      player_2.set_grid
      player_1.place_ships_on_grid('1,1:2,0:2,3:3,4:4,3')
      player_2.place_ships_on_grid('0,1:2,3:3,0:3,4:4,1')
      player_1.attack_on(player_2, '0,1:4,3:2,3:3,1:4,1')
      player_2.attack_on(player_1, '0,1:0,0:1,1:2,3:4,3')
    end

    it 'writes the game result to the output file' do
      allow(File).to receive(:open).with(Battleship::OUTPUT_FILE_PATH, 'w')
      Battleship.write_output(player_1, player_2)
      expect(File).to have_received(:open).with(Battleship::OUTPUT_FILE_PATH, 'w')
    end
  end

  describe '.final_result' do
    let(:player_1) { Player.new(5, 5, 5) }
    let(:player_2) { Player.new(5, 5, 5) }

    before do
      player_1.set_grid
      player_2.set_grid
      player_1.place_ships_on_grid('1,1:2,0:2,3:3,4:4,3')
      player_2.place_ships_on_grid('0,1:2,3:3,0:3,4:4,1')
      player_1.attack_on(player_2, '0,1:4,3:2,3:3,1:4,1')
      player_2.attack_on(player_1, '0,1:0,0:1,1:2,3:4,3')
    end

    it 'determines the final result correctly' do
      result = Battleship.final_result(player_1, player_2)
      expect(result).to eq('It is a draw')
    end
  end
end
