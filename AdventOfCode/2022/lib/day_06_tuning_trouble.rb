# frozen_string_literal: true

class Day06TuningTrouble
  def perform(input_filename)
    calculate(input_filename, 4)
  end

  def perform_pII(input_filename)
    calculate(input_filename, 14)
  end

  def calculate(filename, num)
    File.open(filename).each_char.with_object([]) do |char, read_chars|
      read_chars << char
      return read_chars.length if read_chars.last(num).uniq.count == num
    end
  end
end
