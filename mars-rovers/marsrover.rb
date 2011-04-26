#!/usr/bin/ruby

require File.expand_path("../init.rb", __FILE__)

fi = File.open(InputFile)    
fo = File.open(OutputFile, "w")   

first_line = fi.readline                          #
plateau = Plateau.new(first_line)                 # Initialize plateau object

while !fi.eof?

  initial_position = fi.readline  
  instructions = fi.readline
                                                  # Initialize the rover with the -
  rover = Rover.new(initial_position, plateau)    # - initial poistion on the plateau
  rover.explore(instructions)                     # Ask it to explore according to the instructions 

  fo.write "#{rover.position_and_direction}\n"
end

fo.close
fi.close