# frozen_string_literal: true

require "day_01_calorie_counter"

RSpec.describe Day01CalorieCounter do
  context "with the report" do
    let(:report) do
      generate_file_with_contents("input.txt") do
        <<~EO_REPORT
          1000
          2000
          3000

          4000

          5000
          6000

          7000
          8000
          9000

          10000
        EO_REPORT
      end
    end

    it "returns 24,000 total caloreis" do
      expect(Day01CalorieCounter.new.perform(report)).to eq 24_000
    end

    context "when part II" do
      it "returns 41,000 top 3 calories" do
        expect(Day01CalorieCounter.new.perform_pII(report)).to eq 41_000
      end
    end
  end
end
