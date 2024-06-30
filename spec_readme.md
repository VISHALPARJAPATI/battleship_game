# Battleship Game Project

## Setting Up RSpec for Testing

To set up RSpec in this project, follow these steps:

1. **Create a Gemfile and add RSpec:**

   Create a file named `Gemfile` in the root directory of your project and add the following lines:

   ```ruby
   source 'https://rubygems.org'
   gem 'rspec'

2. **Install RSpec Dependencies:**

  Run the following command to install RSpec and its dependencies:

  ```ruby
  bundle install

3. **Initialize RSpec:**

  Run the following command to initialize RSpec in your project. This will create the spec folder and .rspec file:

  ````ruby
  bundle exec rspec --init

4. **Create Your Spec Files:**

  Create your spec files in the spec folder. For example, you might create spec/player_spec.rb for testing the Player class and spec/battleship_spec.rb for testing the Battleship module.

5. **Run Your Test Cases:**

  Use the following command to run your test cases:

  ````ruby
  bundle exec rspec

