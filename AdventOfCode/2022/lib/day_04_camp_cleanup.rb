# frozen_string_literal: true

require "input_helpers"
class Day04CampCleanup
  include InputHelpers

  def perform(input_filename)
    file_to_lines(input_filename)
      .map do |line|
        matches = /(\d+)-(\d+),(\d+)-(\d+)/.match(line)
        mi = matches.to_a.slice(1..-1).map!(&:to_i) 
        (
          mi[0].between?(mi[2], mi[3]) &&
          mi[1].between?(mi[2], mi[3])
        ) || (
          mi[2].between?(mi[0], mi[1]) &&
          mi[3].between?(mi[0], mi[1])
        )
      end.count(true)
  end

  def perform_pII(input_filename)
    file_to_lines(input_filename)
      .map do |line|
        !line
          .split(",")
          .map { |range| Range.new(*range.split("-").map(&:to_i)).to_set }
          .reduce(&:&)
          .empty?
      end.count(true)
  end
end
