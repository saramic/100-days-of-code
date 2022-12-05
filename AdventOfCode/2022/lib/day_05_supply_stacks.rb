# frozen_string_literal: true

require "input_helpers"
class Day05SupplyStacks
  include InputHelpers

  ALGO_ONE_AT_A_TIME = lambda do |num, from, to, state|
    num.times {
      from_pop = state[from].pop
      state[to].push(from_pop)
    }
  end

  ALGO_BATCH_AT_A_TIME = lambda do |num, from, to, state|
    from_pop = []
    num.times { from_pop << state[from].pop }
    from_pop.reverse!
    state[to].concat(from_pop)
  end

  def perform(input_filename)
    calculate(input_filename, ALGO_ONE_AT_A_TIME)
  end

  def perform_pII(input_filename)
    calculate(input_filename, ALGO_BATCH_AT_A_TIME)
  end

  private

  def calculate(input_filename, algo)
    (state_in, moves_in) = File.read(input_filename).split("\n\n")
    state = read_state(state_in)
    moves_in
      .split("\n")
      .each do |move|
        matches = /move (\d+) from (\d+) to (\d+)/.match(move)
        (num, from, to) = matches.to_a.slice(1..-1).map(&:to_i).to_a
        algo.call(num, from, to, state)
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
