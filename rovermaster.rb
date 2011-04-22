# Require / read the necessary files
require 'lib/rover'
require 'lib/position.rb'
require 'lib/direction.rb'
require 'lib/plateau.rb'

fi = File.open("rovers.input")
fo = File.open("rovers.output", "w")

# Initialize plateau object
first_line = fi.readline
plateau = Plateau.new(first_line)

while !fi.eof?

  initial_position = fi.readline  
  instructions = fi.readline
  rover = Rover.new(initial_position, plateau)
  rover.explore(instructions)

  fo.write "#{rover.final_position_and_direction}\n"
end

fo.close
fi.close