# frozen_string_literal: true

require "input_helpers"
class Day01CalorieCounter
  include InputHelpers

  def perform(report_filename)
    calculate(report_filename)[:max]
  end

  def perform_pII(report_filename)
    calculate(report_filename)[:all].sort.reverse.slice(0, 3).sum
  end

  private

  def calculate(report_filename)
    file_to_numbers(report_filename)
      .map
      .with_object(
        {
          max: 0,
          all: [],
          current: 0,
        },
      ) do |number, totals|
      if number.nil?
        totals[:all] << totals[:current]
        totals[:max] = totals[:current] if totals[:current] > totals[:max]
        totals[:current] = 0
      else
        totals[:current] += number
      end
    end
  end
end
