# frozen_string_literal: true

require "input_helpers"

class Day01SonarSweep
  include InputHelpers

  def perform(report_filename)
    file_to_numbers(report_filename)
      .map
      .with_object(
        {
          increase: 0,
          last: nil,
        },
      ) do |number, totals|
      totals[:increase] += 1 if !totals[:last].nil? && number > totals[:last]
      totals[:last] = number
    end[:increase]
  end

  def perform_pII(report_filename)
    windows = 3
    file_to_numbers(report_filename)
      .each_with_index
      .map
      .with_object(
        {
          increase: 0,
          last: nil,
          total: nil,
          window: [],
        },
      ) do |(number, index), totals|
      totals[:window] << number
      sum = totals[:window].sum if totals[:window].length == windows
      totals[:increase] += 1 if !totals[:last].nil? && sum > totals[:last]
      totals[:last] = sum
      totals[:window].shift if index >= (windows - 1)
    end[:increase]
  end
end
