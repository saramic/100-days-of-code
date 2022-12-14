# frozen_string_literal: true

require "day_00_program"

RSpec.describe Day00Program do
  let(:input) do
    generate_file_with_contents("input.txt") do
      <<~EO_REPORT
      EO_REPORT
    end
  end

  it "returns part 1 answer" do
    expect(
      Day00Program.new.perform(input),
    ).to eq nil # rubocop:disable RSpec/BeEq
  end

  it "returns part 2 answer" do
    expect(
      Day00Program.new.perform_pII(input),
    ).to eq nil # rubocop:disable RSpec/BeEq
  end

  context "when input is the real data file for ME" do
    let(:input) do
      File.join(__dir__, "../inputs/2022_00_input.txt")
    end

    it "returns part 1 answer" do
      expect(
        Day00Program.new.perform(input),
      ).to eq nil # rubocop:disable RSpec/BeEq
    end

    it "returns part 2 answer" do
      expect(
        Day00Program.new.perform_pII(input),
      ).to eq nil # rubocop:disable RSpec/BeEq
    end
  end
end
