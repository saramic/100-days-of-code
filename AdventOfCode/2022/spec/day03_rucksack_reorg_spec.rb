# frozen_string_literal: true

require "day_03_rucksack_reorg"

RSpec.describe Day03RucksackReorg do
  let(:input) do
    generate_file_with_contents("input.txt") do
      <<~EO_REPORT
        vJrwpWtwJgWrhcsFMMfFFhFp
        jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
        PmmdzqPrVvPwwTWBwg
        wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
        ttgJtRGJQctTZtZT
        CrZsJsPPZsGzwwsLwLmpwMDw
      EO_REPORT
    end
  end

  it "returns part 1 answer" do
    expect(
      Day03RucksackReorg.new.perform(input),
    ).to eq 157
  end

  it "returns part 2 answer" do
    expect(
      Day03RucksackReorg.new.perform_pII(input),
    ).to eq 70
  end

  context "when input is the real data file for ME" do
    let(:input) do
      File.join(__dir__, "../inputs/2022_3_input.txt")
    end

    it "returns part 1 answer" do
      expect(
        Day03RucksackReorg.new.perform(input),
      ).to eq 7_691
    end

    it "returns part 2 answer" do
      expect(
        Day03RucksackReorg.new.perform_pII(input),
      ).to eq 2_508
    end
  end
end
