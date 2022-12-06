# frozen_string_literal: true

class Day06TuningTrouble
  def perform(input_filename)
    calculate(input_filename, 4)
  end

  def perform_pII(input_filename)
    calculate(input_filename, 14)
  end

  def calculate(filename, num)
    File.read(filename).each_char
      .each_cons(num).with_index.find do |chars, index|
        chars.uniq.count == num
      end.last + num
  end
end
