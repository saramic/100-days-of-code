# frozen_string_literal: true

require "input_helpers"
class Day03Program
  include InputHelpers

  def perform(input_filename)
    file_to_lines(input_filename)
      .map do |line|
      left = line[0..(line.length / 2) - 1].chars.to_set
      right = line[(line.length / 2)..].chars.to_set
      different = (left & right).first
      (("a".."z").to_a | ("A".."Z").to_a).index(different) + 1
    end.sum
  end

  def perform_pII(input_filename)
    file_to_lines(input_filename)
      .each_slice(3)
      .map do |lines|
        different = lines.map { _1.chars.to_set }.reduce(&:&).first
        (("a".."z").to_a | ("A".."Z").to_a).index(different) + 1
      end.sum
  end
end
