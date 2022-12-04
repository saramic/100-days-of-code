# frozen_string_literal: true

require "day_04_camp_cleanup"

RSpec.describe Day04CampCleanup do
  let(:input) do
    generate_file_with_contents("input.txt") do
      <<~EO_REPORT
        2-4,6-8
        2-3,4-5
        5-7,7-9
        2-8,3-7
        6-6,4-6
        2-6,4-8
      EO_REPORT
    end
  end

  it "returns part 1 answer" do
    expect(
      Day04CampCleanup.new.perform(input),
    ).to eq 2
  end

  it "returns part 2 answer" do
    expect(
      Day04CampCleanup.new.perform_pII(input),
    ).to eq 4
  end

  context "when input is the real data file for ME" do
    let(:input) do
      File.join(__dir__, "../inputs/2022_4_input.txt")
    end

    it "returns part 1 answer" do
      expect(
        Day04CampCleanup.new.perform(input),
      ).to eq 471
    end

    it "returns part 2 answer" do
      expect(
        Day04CampCleanup.new.perform_pII(input),
      ).to eq 888
    end
  end
end
