#!/usr/bin/ruby

AcceptanceDataFile = File.expand_path("../io/acceptance.yaml",__FILE__)
MarsRoverExecutable = File.expand_path("../marsrover.rb", __FILE__)

require File.expand_path("../init.rb", __FILE__)
require File.expand_path("../test/acceptance_test.rb", __FILE__)

AcceptanceTest.new.run_acceptance_tests
