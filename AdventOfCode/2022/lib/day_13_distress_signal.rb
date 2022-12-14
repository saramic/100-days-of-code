# frozen_string_literal: true

require "JSON"

class Day13DistressSignal
  def perform(input_filename)
    File
      .read(input_filename)
      .split("\n\n")
      .map { _1.split("\n") }
      .map { _1.map { |pair| JSON.parse(pair) } }
      .map
      .with_index(1)
      .find_all do |(left, right), index|
        compare(left, right)
      end.map { |(left, right), index| index }.sum
  end

  def perform_pII(input_filename)
    dividers = [2, 6].map { [_1] }
    packets = [nil] + File
      .read(input_filename)
      .split("\n\n")
      .map { _1.gsub("[]", "[0]") }
      .map { _1.split("\n") }
      .map { _1.map { |pair| JSON.parse(pair) } }
      .reduce([]) do |acc, (left, right)|
        acc << left << right
      end.concat(dividers)
      .sort_by(&:flatten)
    dividers
      .map { packets.index(_1) }
      .reduce(:*)
  end

  def compare(left, right)
    return if left.empty? && right.empty?
    return true if left.empty?
    return false if right.empty?

    firsts = [left.first, right.first]

    case firsts
    in [Integer, Integer]
      return true if firsts.reduce(:<)
      return false if firsts.reduce(:>)
    else
      firsts.map! { _1.instance_of?(Integer) ? [_1] : _1 }
      comp = compare(firsts[0], firsts[1])
      return comp if [true, false].include? comp
    end

    compare(left.slice(1..), right.slice(1..))
  end
end
