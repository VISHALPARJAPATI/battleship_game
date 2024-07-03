# require
  Purpose: Used to include external libraries, gems, or other files from the Ruby load path.
  Path: Typically uses `absolute paths` or paths relative to the load path.
  Usage: Best for loading standard libraries or gems.

  ````ruby
    require 'json'  # Loads the JSON library
    require '/path/to/your/project/lib/some_library'  # Absolute path
  ````

# require_relative
  Purpose: Used to include files relative to the file containing the require_relative statement.
  Path: Uses paths relative to the current file's location.
  Usage: Best for loading files within the same project or directory structure.

  ````ruby
    require_relative 'some_library'  # Loads 'some_library' from the same directory as the current file
    require_relative '../lib/some_library'  # Loads 'some_library' from the lib directory, one level up
  ````