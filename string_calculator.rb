class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = parse_input(numbers)
    numbers.split(delimiter).map(&:to_i).sum
  end

  private

  def self.parse_input(numbers)
    if numbers.start_with?("//")
      delimiter_end = numbers.index("\n") # Find the end of the delimiter definition
      delimiter = numbers[2..delimiter_end - 1] # Extract the delimiter string
      numbers = numbers[(delimiter_end + 1)..] # Remove the delimiter definition part and newline character
    end
    delimiter ||= /[\n,]/
    [delimiter, numbers]
  end
end
