# frozen_string_literal: true

require "day_02_rock_paper_scissors"

RSpec.describe Day02RockPaperScissors do
  let(:input) do
    generate_file_with_contents("input.txt") do
      <<~EO_REPORT
        A Y
        B X
        C Z
      EO_REPORT
    end
  end

  it "returns part 1 answer" do
    expect(
      Day02RockPaperScissors.new.perform(input),
    ).to eq 15
  end

  it "returns part 2 answer" do
    expect(
      Day02RockPaperScissors.new.perform_pII(input),
    ).to eq 12
  end

  context "when input is the real data file for ME" do
    let(:input) do
      File.join(__dir__, "../inputs/2022_2_input.txt")
    end

    it "returns part 1 answer" do
      expect(
        Day02RockPaperScissors.new.perform(input),
      ).to eq 12_458
    end

    it "returns part 2 answer" do
      expect(
        Day02RockPaperScissors.new.perform_pII(input),
      ).to eq 12_683
    end
  end
end
