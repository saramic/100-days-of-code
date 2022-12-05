# frozen_string_literal: true

require "day_05_supply_stacks"

RSpec.describe Day05SupplyStacks do
  let(:input) do
    generate_file_with_contents("input.txt") do
      <<~EO_REPORT
            [D]    
        [N] [C]    
        [Z] [M] [P]
        1   2   3 
        
        move 1 from 2 to 1
        move 3 from 1 to 3
        move 2 from 2 to 1
        move 1 from 1 to 2
      EO_REPORT
    end
  end

  it "returns part 1 answer" do
    expect(
      Day05SupplyStacks.new.perform(input),
    ).to eq "CMZ"
  end

  it "returns part 2 answer" do
    expect(
      Day05SupplyStacks.new.perform_pII(input),
    ).to eq "MCD"
  end

  context "when input is the real data file for ME" do
    let(:input) do
      File.join(__dir__, "../inputs/2022_5_input.txt")
    end

    it "returns part 1 answer" do
      expect(
        Day05SupplyStacks.new.perform(input),
      ).to eq "FZCMJCRHZ"
    end

    it "returns part 2 answer" do
      expect(
        Day05SupplyStacks.new.perform_pII(input),
      ).to eq "JSDHQMZGF"
    end
  end
end
