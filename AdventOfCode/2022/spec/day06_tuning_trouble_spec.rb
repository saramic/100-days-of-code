# frozen_string_literal: true

require "day_06_tuning_trouble"

RSpec.describe Day06TuningTrouble do
  [
    {input: "mjqjpqmgbljsphdztnvjfqwrcgsmlb", output: 7},
    {input: "bvwbjplbgvbhsrlpgdmjqwftvncz", output: 5},
    {input: "nppdvjthqldpwncqszvftbrmjlhg", output: 6},
    {input: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", output: 10},
    {input: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", output: 11},
  ].each_with_index do |args, index|
    it "returns part 1 answer for #{args[:input].inspect} returns: #{args[:output]}" do
      input = generate_file_with_contents("input_#{index}.txt") do
        args[:input]
      end
      expect(
        Day06TuningTrouble.new.perform(input),
      ).to eq args[:output]
    end
  end

  [
    {input: "mjqjpqmgbljsphdztnvjfqwrcgsmlb", output: 19},
    {input: "bvwbjplbgvbhsrlpgdmjqwftvncz", output: 23},
    {input: "nppdvjthqldpwncqszvftbrmjlhg", output: 23},
    {input: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", output: 29},
    {input: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", output: 26},
  ].each_with_index do |args, index|
    it "returns part 2 answer for #{args[:input].inspect} returns: #{args[:output]}" do
      input = generate_file_with_contents("input_#{index}.txt") do
        args[:input]
      end
      expect(
        Day06TuningTrouble.new.perform_pII(input),
      ).to eq args[:output]
    end
  end

  context "when input is the real data file for ME" do
    let(:input) do
      File.join(__dir__, "../inputs/2022_6_input.txt")
    end

    it "returns part 1 answer" do
      expect(
        Day06TuningTrouble.new.perform(input),
      ).to eq 1623
    end

    it "returns part 2 answer" do
      expect(
        Day06TuningTrouble.new.perform_pII(input),
      ).to eq 3774
    end
  end
end
