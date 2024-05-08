# string_calculator.rb

class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?("//")
      delimiter, numbers = parse_custom_delimiter(numbers)
    end

    negatives = []
    sum = numbers.split(/#{delimiter}|\n/).map(&:to_i).inject(0) do |sum, num|
      if num < 0
        negatives << num
      else
        sum += num
      end
      sum
    end

    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    else
      sum
    end
  end

  private

  def self.parse_custom_delimiter(numbers)
    delimiter = numbers[2]
    numbers = numbers[4..]
    [delimiter, numbers]
  end
end
