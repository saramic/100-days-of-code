# frozen_string_literal: true

require "input_helpers"
class Day06TuningTrouble
  include InputHelpers

  def perform(input_filename)
    calculate(input_filename, 4)
  end

  def perform_pII(input_filename)
    calculate(input_filename, 14)
  end

  def calculate(filename, num)
    chars = File.read(filename).chars
    (0..chars.size).each do |index|
      return index + num if chars.slice(index, num).uniq.count == num
    end
  end
end
