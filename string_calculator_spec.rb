# string_calculator_spec.rb

require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'when given a single number' do
      it 'returns the number' do
        expect(StringCalculator.add('1')).to eq(1)
      end
    end

    context 'when given two numbers separated by commas' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add('1,5')).to eq(6)
      end
    end

    context 'when given multiple numbers separated by commas' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add('1,2,3,4')).to eq(10)
      end
    end

    context 'when given numbers separated by new lines and commas' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when given a custom delimiter' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
      end
    end

    context 'when given negative numbers' do
      it 'raises an exception with the negative number' do
        expect { StringCalculator.add('1,-2,3') }.to raise_error(RuntimeError, 'negative numbers not allowed -2')
      end

      it 'raises an exception with all negative numbers' do
        expect { StringCalculator.add('1,-2,-3') }.to raise_error(RuntimeError, 'negative numbers not allowed -2,-3')
      end
    end
  end
end
