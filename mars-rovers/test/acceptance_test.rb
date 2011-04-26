require 'yaml'
class AcceptanceTest
  
  # - read all accpetance test data 
  # - for each test data set in it,
  #   - create the rover input file
  #   - execute the rovermaster on it
  #   - compare the output with acceptance data
  def run_acceptance_tests
    all_tests = YAML::load File.read AcceptanceDataFile
    all_tests.each_pair do |test_case, test_data|
      write_to_input_file(test_data["input"])
      execute_rovermaster
      compare_output(test_case, test_data["expected"])
    end
  end

  private 
  
  def write_to_input_file(input_data)
    fi = File.open(InputFile, "w")
    fi.write input_data
    fi.close
  end  

  def execute_rovermaster
    command = "#{MarsRoverExecutable}"
    `#{command}`
  end

  def compare_output(test_case, expected_output)
    input_lines = expected_output.split(/\n/)
    output = File.read(OutputFile)
    output.split(/\n/).each do |oline|
      eline = input_lines.shift
      unless (oline == eline)
        print "Failed test: #{test_case}" 
        return
      end
    end
  end 
      
end
