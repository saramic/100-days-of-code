# frozen_string_literal: true

class Day06TuningTrouble
  def perform(input_filename)
    calculate(input_filename, 4)
  end

  def perform_pII(input_filename)
    calculate(input_filename, 14)
  end

  def calculate(filename, num)
    chars = File.read(filename).chars
    (num..chars.size).each do |index|
      return index if chars.slice(index - num, num).uniq.count == num
    end
  end
end
