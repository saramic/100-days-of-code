# frozen_string_literal: true

require "day_07_space_on_device"

RSpec.describe Day07SpaceOnDevice do
  let(:input) do
    generate_file_with_contents("input.txt") do
      <<~EO_REPORT
        $ cd /
        $ ls
        dir a
        14848514 b.txt
        8504156 c.dat
        dir d
        $ cd a
        $ ls
        dir e
        29116 f
        2557 g
        62596 h.lst
        $ cd e
        $ ls
        584 i
        $ cd ..
        $ cd ..
        $ cd d
        $ ls
        4060174 j
        8033020 d.log
        5626152 d.ext
        7214296 k
      EO_REPORT
    end
  end

  it "returns part 1 answer" do
    expect(
      Day07SpaceOnDevice.new.perform(input),
    ).to eq 95_437
  end

  it "returns part 2 answer" do
    expect(
      Day07SpaceOnDevice.new.perform_pII(input),
    ).to eq 24_933_642
  end

  context "when input is the real data file for ME" do
    let(:input) do
      File.join(__dir__, "../inputs/2022_7_input.txt")
    end

    it "returns part 1 answer" do
      expect(
        Day07SpaceOnDevice.new.perform(input),
      ).to eq 1_749_646
    end

    it "returns part 2 answer" do
      expect(
        Day07SpaceOnDevice.new.perform_pII(input),
      ).to eq 1_498_966
    end
  end
end
