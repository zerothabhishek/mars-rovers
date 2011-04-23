
## Solution for the MARS ROVERS problem for ThoughtWorks recruitment
=====================================================================



## Problem description
======================

PROBLEM ONE: MARS ROVERS
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.
A rover's position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.
In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading.
Assume that the square directly North from (x, y) is (x, y+1).
 
INPUT:
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.
The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.
The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.
Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.
 
OUTPUT
The output for each rover should be its final co-ordinates and heading.
 
INPUT AND OUTPUT
Test Input:
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
Expected Output:
1 3 N
5 1 E




## Solution and Verification
=====================================================================
	 
./rovermaster.rb
Takes rover input data (plateau, rovers' initial position and direction) from the input file, 
and writes the output (final rover position-direction for all rovers) to the output file
Input : io/rovers.input
Output: io/rovers.output

./acceptance.rb	
Runs acceptance tests on `rovermaster` by running it for all acceptance data, 
and comparing it with the expected outcomes
Acceptance data: io/acceptance.yaml



## Code Description
=====================================================================

rovermaster.rb: 
ruby script that gets the functionality executed by using necessary classes and files

acceptance.rb: 
ruby script that runs all the unit tests

init.rb: 
Initializes the application by loading all the class files, and setting input/output constants

lib: contains class definitions 
 + rover.rb
 + position.rb
 + direction.rb
 + plateau.rb

test: contains acceptance tests and unit tests for each of the classes, and a helper script
 + accpetance_test.rb
 + rover_test.rb
 + position_test.rb
 + direction_test.rb
 + plateau_test.rb
 + test_helper.rb

io: contains the input and output files
 + rovers.input
 + rovers.ouput
 + acceptance.yaml



## Assumptions
=====================================================================

- If a rover is at the edge of the plateau, it will ignore any command that can push it out of the plateau



## Dependencies
=====================================================================

- Ruby 1.8.7 
- Mocha 0.9.10 gem for unit tests


