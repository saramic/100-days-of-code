# frozen_string_literal: true

require "day_01_sonar_sweep"

RSpec.describe Day01SonarSweep do
  context "with the report" do
    let(:report) do
      generate_file_with_contents("input.txt") do
        <<~EO_REPORT
          199
          200
          208
          210
          200
          207
          240
          269
          260
          263
        EO_REPORT
      end
    end

    it "returns 7 measurements that are larger the the previous" do
      expect(Day01SonarSweep.new.perform(report)).to eq 7
    end

    context "when part II" do
      it "returns 5 measurements for PART II using 3 windows" do
        expect(Day01SonarSweep.new.perform_pII(report)).to eq 5
      end
    end
  end
end
