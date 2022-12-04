# frozen_string_literal: true

module InputHelpers
  def file_to_lines(filename)
    File
      .read(filename)
      .split("\n")
  end

  def file_to_numbers(filename)
    file_to_lines(filename)
      .map { |line| Integer(line) if /^\d+$/.match?(line) }
  end

  def file_to_tokens(filename)
    file_to_lines(filename)
      .map do |line|
        line
          .split
          .map do |token|
            /^\d+$/.match?(token) ?
              Integer(token) :
              token
          end
      end
  end
end
