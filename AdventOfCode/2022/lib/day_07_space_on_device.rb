# frozen_string_literal: true

class Day07SpaceOnDevice
  TOTOAL_DISK = 70_000_000
  MIN_UNUSED_DISK = 30_000_000

  class Tree
    attr_accessor :depth, :dir, :path, :parent, :children
    def initialize(depth, dir, path, parent, size: nil)
      @depth = depth
      @dir = dir
      @path = path
      @parent = parent
      @children = []
      @size = size
    end

    def size
      @size || children.map(&:size).flatten.sum
    end

    def to_s
      "\n#{Array.new(depth, " ").join} #{dir ? "dir" : "file"} #{path} (#{size})" + @children.map(&:to_s).join
    end
  end

  def perform(input_filename)
    root = calculate(input_filename)
    root.to_s.split("\n")
      .find_all do |line|
        line[/dir.+\((\d*)/, 1].to_i < 100_000
      end.map do |line|
        line[/dir.+\((\d*)/, 1].to_i
      end.sum
  end

  def perform_pII(input_filename)
    root = calculate(input_filename)
    min_require = MIN_UNUSED_DISK - (TOTOAL_DISK - root.size)
    root.to_s.split("\n")
      .find_all do |line|
        line =~ /dir/
      end.sort_by do |line|
        line[/dir.+\((\d*)/, 1].to_i
      end.find do |line|
        line[/dir.+\((\d*)/, 1].to_i > min_require
      end[/dir.+\((\d*)/, 1].to_i
  end

  def calculate(input_filename)
    root = nil
    current = nil
    listing = false
    depth = 0
    File
      .read(input_filename)
      .split("\n")
      .map do |line|
        if (matches = /^\$ cd (?<dir>.*)$/.match(line))
          depth += 1
          dir = matches[:dir]
          node = Tree.new(depth, true, dir, nil)
          if dir == "/"
            root = node
            current ||= node
          elsif dir == ".."
            depth -= 1
            current = current.parent
          else
            current = current.children.find { |node| node.path == dir }
          end
        end
        if /^\$ ls$/.match?(line)
          listing = true
        end
        if (matches = /^dir (?<dir>.*)$/.match(line))
          current.children << Tree.new(depth, true, matches[:dir], current)
        end
        if (matches = /^(?<size>\d+) (?<file>.*)$/.match(line))
          current.children << Tree.new(
            depth, false, matches[:file], current, size: matches[:size].to_i
          )
        end
      end
    root
  end
end
