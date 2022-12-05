# frozen_string_literal: true

require "input_helpers"
class Day05SupplyStacks
  include InputHelpers

  def perform(input_filename)
    (state_in, moves_in) = File.read(input_filename).split("\n\n")
    state = read_state(state_in)
    moves_in
      .split("\n")
      .each do |move|
        matches = /move (\d+) from (\d+) to (\d+)/.match(move)
        num = matches[1].to_i
        from = matches[2].to_i
        to = matches[3].to_i
        num.times {
          from_pop = state[from].pop
          state[to].push(from_pop)
        }
      end
    state.map { |col| col[1].last }.join
  end

  def perform_pII(input_filename)
    (state_in, moves_in) = File.read(input_filename).split("\n\n")
    state = read_state(state_in)
    moves_in
      .split("\n")
      .each do |move|
        matches = /move (\d+) from (\d+) to (\d+)/.match(move)
        num = matches[1].to_i
        from = matches[2].to_i
        to = matches[3].to_i
        from_pop = []
        num.times { from_pop << state[from].pop }
        from_pop.reverse!
        state[to].concat(from_pop)
      end
    state.map { |col| col[1].last }.join
  end

  def read_state(state_in)
    state = state_in
      .split("\n")
      .map do |line|
        values_from_line(line)
      end.reverse.transpose
    state.map!(&:compact)
    state.map { |line| [line[0], line.slice(1..-1)] }.to_h
  end

  def values_from_line(line)
    (0..line.length)
      .step(4)
      .map do |char|
        line_char = line.slice(char, 3)
        /\d/.match?(line) ?
          line_char[/(\d+)/, 1].to_i :
          line_char[/\[(\w+)\]/, 1]
      end
  end
end
