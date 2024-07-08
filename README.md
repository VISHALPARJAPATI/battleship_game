# Game of Battleships

## Overview

Game of Battleships is a simulation of the classic Battleship game played between two players. Each player is initialized with a grid of a specified size with a certain number of ships placed at predefined positions. The objective is to destroy the opponent's ships using a limited number of missiles. The player who inflicts the most damage wins.

## Features

- Object-Oriented Design
- No external libraries/frameworks required (except for testing)
- Comprehensive unit tests
- Adheres to good coding practices and principles
- Compatible with Linux

## Requirements

- Ruby
- Bundler

## Setup

To set up the Battleship game and RSpec for testing, follow these steps:

1. **Clone the Repository:**

   ```sh
   git clone <your-repo-url>
   cd <your-repo-directory>
   ```

2. **Create a Gemfile and Add RSpec:**

   Create a file named `Gemfile` in the root directory of your project and add the following lines:

   ```ruby
   source 'https://rubygems.org'
   gem 'rspec'
   ```

3. **Install RSpec Dependencies:**

   Run the following command to install RSpec and its dependencies:

   ```sh
   bundle install
   ```

4. **Initialize RSpec:**

   Run the following command to initialize RSpec in your project. This will create the `spec` folder and `.rspec` file:

   ```sh
   bundle exec rspec --init
   ```

5. **Create Your Spec Files:**

   Create your spec files in the `spec` folder. For example, you might create `spec/player_spec.rb` for testing the `Player` class and `spec/battleship_spec.rb` for testing the `Battleship` module.

6. **Run Your Test Cases:**

   Use the following command to run your test cases:

   ```sh
   bundle exec rspec
   ```

## Game Rules

- Each player has an M x M grid.
- Each player has S ships placed at specified positions on the grid.
- Each ship occupies a single position on the grid.
- Each player has T missiles to attack the opponent's ships.
- The objective is to destroy the opponent's ships.
- The game ends when all missiles are used, and the player who destroys the most ships wins. If both players destroy the same number of ships, the game ends in a draw.

## Input and Output

### Input

The input for the game is read from a file named `input.txt` with the following format:

1. Size of the battleground `M` (1 < M < 10)
2. Number of ships `S` (1 <= S <= M^2 / 2)
3. Player 1 ship positions in the format `x1,y1:x2,y2:...`
4. Player 2 ship positions in the format `x1,y1:x2,y2:...`
5. Total number of missiles `T` (1 < T < 100)
6. Player 1 moves in the format `x1,y1:x2,y2:...`
7. Player 2 moves in the format `x1,y1:x2,y2:...`

### Example Input File (`input.txt`)

```
5
5
1,1:2,0:2,3:3,4:4,3
0,1:2,3:3,0:3,4:4,1
5
0,1:4,3:2,3:3,1:4,1
0,1:0,0:1,1:2,3:4,3
```

### Output

The output is written to a file named `output.txt` with the following format:

- Grids of both players after the simulation.
- Alive ships are denoted with "B".
- Hit ships are denoted with "X".
- Missed shots are denoted with "O".
- Total hits by each player.
- Final game result.

### Example Output File (`output.txt`)

```
Player1
O O _ _ _
_ X _ _ _
B _ _ X _
_ _ _ _ B
_ _ _ X _

Player2
_ X _ _ _
_ _ _ _ _
_ _ _ X _
B O _ _ B
_ X _ O _

P1:3
P2:3
It is a draw
```

## Running the Game

To run the game, execute the following command in the root directory of your project:

```sh
ruby lib/battleship.rb
```

## Code Structure

- `lib/battleship.rb`: Main game logic.
- `lib/player.rb`: Player class handling grid and actions.
- `lib/error_handler.rb`: Module for error handling.
- `spec/player_spec.rb`: Unit tests for the Player class.
- `spec/battleship_spec.rb`: Unit tests for the Battleship module.

## Contributing

Feel free to fork the repository and submit pull requests for any improvements or bug fixes.

## License

This project is licensed under the MIT License.
