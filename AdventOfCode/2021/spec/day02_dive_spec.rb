# frozen_string_literal: true

require "day_02_dive"

RSpec.describe Day02Dive do
  context "with submarine commands" do
    let(:submarine_commands) do
      generate_file_with_contents("input.txt") do
        <<~EO_REPORT
          forward 5
          down 5
          forward 8
          up 3
          down 8
          forward 2
        EO_REPORT
      end
    end

    it "returns the horizontal position, depth and horizontal * depth when perform is called" do
      day02_dive = Day02Dive.new(submarine_commands)
      expect(day02_dive.horizontal).to eq 15
      expect(day02_dive.depth).to eq 10
      expect(day02_dive.perform).to eq 150
    end

    context "when part II" do
      it "takes aim into account" do
        day02_dive = Day02Dive.new(submarine_commands, pII: true)
        expect(day02_dive.horizontal).to eq 15
        expect(day02_dive.depth).to eq 60
        expect(day02_dive.perform).to eq 900
      end
    end
  end
end
