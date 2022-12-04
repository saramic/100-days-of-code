# frozen_string_literal: true

require "input_helpers"
class Day03RucksackReorg
  include InputHelpers

  def perform(input_filename)
    file_to_lines(input_filename)
      .map do |line|
        left, right = line.partition(%r(.{#{line.size / 2}}))[1, 2]
        find_odd_character([left, right])
      end.map(&method(:letter_to_number_offset)).sum
  end

  def perform_pII(input_filename)
    file_to_lines(input_filename)
      .each_slice(3)
      .map do |lines|
        find_odd_character(lines)
      end.map(&method(:letter_to_number_offset)).sum
  end

  private

  def letter_to_number_offset(letter)
    (("a".."z").to_a | ("A".."Z").to_a).index(letter) + 1
  end

  def find_odd_character(ary)
    ary.map { _1.chars.to_set }.reduce(&:&).first
  end
end
