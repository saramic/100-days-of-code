# frozen_string_literal: true

require "day_13_distress_signal"

RSpec.describe Day13DistressSignal do
  let(:input) do
    generate_file_with_contents("input.txt") do
      <<~EO_REPORT
        [1,1,3,1,1]
        [1,1,5,1,1]

        [[1],[2,3,4]]
        [[1],4]

        [9]
        [[8,7,6]]

        [[4,4],4,4]
        [[4,4],4,4,4]

        [7,7,7,7]
        [7,7,7]

        []
        [3]

        [[[]]]
        [[]]

        [1,[2,[3,[4,[5,6,7]]]],8,9]
        [1,[2,[3,[4,[5,6,0]]]],8,9]
      EO_REPORT
    end
  end

  it "returns part 1 answer" do
    expect(
      Day13DistressSignal.new.perform(input),
    ).to eq 13
  end

  it "returns part 2 answer" do
    expect(
      Day13DistressSignal.new.perform_pII(input),
    ).to eq 140
  end

  context "with pairs" do
    [
      [[1, 1, 3, 1, 1], [1, 1, 5, 1, 1], true],
      [[[1], [2, 3, 4]], [[1], 4], true],
      [[9], [[8, 7, 6]], false],
      [[[4, 4], 4, 4], [[4, 4], 4, 4, 4], true],
      [[7, 7, 7, 7], [7, 7, 7], false],
      [[], [3], true],
      [[[[]]], [[]], false],
      [[1, [2, [3, [4, [5, 6, 7]]]], 8, 9], [1, [2, [3, [4, [5, 6, 0]]]], 8, 9], false],
    ].each_with_index do |(left, right, result), index|
      it "problem #{index + 1} returns #{result.inspect}" do
        expect(
          Day13DistressSignal.new.compare(left, right),
        ).to eq result
      end
    end
  end

  context "when input is the real data file for ME" do
    let(:input) do
      File.join(__dir__, "../inputs/2022_13_input.txt")
    end

    it "returns part 1 answer" do
      expect(
        Day13DistressSignal.new.perform(input),
        # ).to eq 516 # wrong answer
        # ).to eq 666 # wrong answer
      ).to eq 5_292
    end

    it "returns part 2 answer" do
      expect(
        Day13DistressSignal.new.perform_pII(input),
      ).to eq 23_868
    end
  end
end
