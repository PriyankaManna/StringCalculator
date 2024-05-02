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
  end
end
