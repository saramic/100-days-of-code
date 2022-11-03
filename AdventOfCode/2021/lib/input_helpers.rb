# frozen_string_literal: true

module InputHelpers
  def file_to_numbers(filename)
    File
      .read(filename)
      .split("\n")
      .map { |line| Integer(line) }
  end

  def file_to_tokens(filename)
    File
      .read(filename)
      .split("\n")
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
