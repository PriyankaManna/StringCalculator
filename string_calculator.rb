class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = parse_input(numbers)
    parsed_numbers = numbers.split(delimiter).map(&:to_i)

    negatives = parsed_numbers.select { |num| num < 0 }
    raise StandardError, "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    parsed_numbers.reject { |num| num > 1000 }.sum
  end

  private

  def self.parse_input(numbers)
    if numbers.start_with?("//")
      delimiter_end = numbers.index("\n") # Find the end of the delimiter definition
      delimiter = numbers[2..delimiter_end - 1] # Extract the delimiter string
      numbers = numbers[(delimiter_end + 1)..] # Remove the delimiter definition part and newline character

      delimiters = delimiter.scan(/\[([^\[\]]+)\]/).flatten.map { |d| Regexp.escape(d) }
      delimiter = Regexp.new(delimiters.join('|')) # Create a regex pattern to match any of the delimiters
    else
      delimiter = /[\n,]/
    end
    [delimiter, numbers]
  end
end
