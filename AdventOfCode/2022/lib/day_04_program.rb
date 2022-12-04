# frozen_string_literal: true

require "input_helpers"
class Day04Program
  include InputHelpers

  def perform(input_filename)
    file_to_lines(input_filename)
      .map do |line|
        sections = line
          .split(",")
          .map { |range| eval(range.sub("-", "..")).to_set }
        sections[0].subset?(sections[1]) || sections[1].subset?(sections[0])
      end.count(true)
  end

  def perform_pII(input_filename)
    file_to_lines(input_filename)
      .map do |line|
        !line
          .split(",")
          .map { |range| eval(range.sub("-", "..")).to_set }
          .reduce(&:&)
          .empty?
      end.count(true)
  end
end
