class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = parse_input(numbers)
    negatives = numbers.split(delimiter).map(&:to_i).select { |num| num < 0 }

    if negatives.any?
      raise StandardError, "Negatives not allowed: #{negatives.join(', ')}"
    end

    numbers.split(delimiter).map(&:to_i).reject { |num| num > 1000 }.sum
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
