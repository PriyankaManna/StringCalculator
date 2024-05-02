class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    # handle new line and comma to seperate values
    numbers.split(/[\n,]/).map(&:to_i).sum
  end
end
