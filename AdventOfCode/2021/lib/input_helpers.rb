# frozen_string_literal: true

module InputHelpers
  def file_to_numbers(filename)
    File.read(filename).split("\n").map { |line| Integer(line) }
  end
end
