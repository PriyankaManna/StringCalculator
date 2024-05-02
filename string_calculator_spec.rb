require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number for a string containing one number' do
      expect(StringCalculator.add('1')).to eq(1)
    end

    it 'returns the sum of two numbers in a string' do
      expect(StringCalculator.add('1,2')).to eq(3)
    end

    it 'returns the sum of multiple numbers in a string' do
      expect(StringCalculator.add('1,2,3,4')).to eq(10)
    end

    it 'returns the sum of multiple numbers in a string' do
      expect(StringCalculator.add('1,2,3,4,5,6,7,8,10,20,30,40,50,100')).to eq(286)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'handles new lines and commas mixed between numbers' do
      expect(StringCalculator.add("1\n2,3\n4,5")).to eq(15)
    end

    it 'supports different delimiters with single character' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'supports different delimiters with single character' do
      expect(StringCalculator.add("//\n2;6")).to eq(8)
    end

    it 'raises an exception for negative numbers' do
      expect { StringCalculator.add('1,-2,3,-4') }.to raise_error(StandardError, "Negatives not allowed: -2, -4")
    end

    it 'raises an exception for a single negative number' do
      expect { StringCalculator.add('-5') }.to raise_error(StandardError, "Negatives not allowed: -5")
    end

    it 'does not raise an exception for positive numbers' do
      expect { StringCalculator.add('1,2,3,4') }.not_to raise_error
    end

    it 'ignores numbers larger than 1000' do
      expect(StringCalculator.add('2,1001')).to eq(2)
    end

    it 'correctly sums numbers less than or equal to 1000' do
      expect(StringCalculator.add('2,1000')).to eq(1002)
    end

    it 'ignores numbers larger than 1000' do
      expect(StringCalculator.add('22,3420')).to eq(22)
    end

    it 'supports custom delimiter of any length' do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it "supports multiple custom delimiters" do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
    end
  end
end
