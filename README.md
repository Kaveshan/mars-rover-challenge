Rover Challenge
==========

The Rover Challenge, takes instructions from base these instructions control the rover's movement to allow the rover to land safely onto Mars.

Getting Started
==========

```sh
git clone git@github.com:Kaveshan/rover-challenge.git
cd rover-challenge/
bundle install
```

Input
=====

Please edit commands.txt file with the below format for instructions.

P.S One set of instructions to be added to the file.

```sh
8 8
1 2 E
MMLMRMMRRMML
```

Execution
========

Once instuctions have been entered and saved to commands.txt, please proceed to execute the code by typing the below command:

P.S Make sure you are in the rover-challenge directory before running this command

```sh
ruby control_rover.rb
```

Output
=====

The output will print the co-ordinates of the rover in a message as below:

Example output

```sh
"Rover is within Mars surface and is safe to land, co-ordinates: 3 3 S"
```

If the rover is out of the surface of Mars it will print the co-ordinates of the rover in a message as below:

Example output

```sh
"Rover in NOT within Mars surface and is NOT safe to land, co-ordinates 11 10 S"
```

Libraries
=======

The following libraries have been used to build this project

- Ruby
- Rspec
- Pry

Testing
======

To run the test suite:

```sh
./bin/rspec spec/
```

OR

```sh
bundle exec rspec spec/
```

Design
======

- I have taken the time to read through the challenge,
- I mapped out all possible aspects of directions and variables to be used and assigned,
- Did a visual on paper as to how the Input, Execution and Output will look,
- Programing language used is Ruby,
- Implemented Rspec, it is my prefered testing library,
- Implemented Pry as a debugging tool used throughout the development process,
- Built the Project using TDD practice( I strive to build my software and try my utmost best to use TDD )
- Completed Rspec and had failing tests,
- Started with the actual project to be executed and start making my test suite pass one at a time until I see the green light. :)