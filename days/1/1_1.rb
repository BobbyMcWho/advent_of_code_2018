class FrequencyCalibrator
  # Takes an input and returns the sum of all the values contained in the input.
  #
  # @param input [File, Array, String] File or string values must be newline separated and interpolated.
  # @return [Integer] the sum of all parsed input values.
  def self.analyze(input)
    frequencies = []
    if File.file?(File.join(__dir__, input))
      frequencies = parse_file(input)
    elsif input.is_a? Array
      frequencies = input.map(&:to_i)
    elsif input.is_a? String
      frequencies = input.split("\n").map(&:to_i)
    else
      raise ArgumentError "Invalid input, must be a File, Array, or String"
    end
    frequencies.reduce(:+)
  end

  private_class_method
  def self.parse_file(input)
    File.read(File.join(__dir__, input)).split("\n").map(&:to_i)
  end
end

puts FrequencyCalibrator.analyze('inputs_1.txt')