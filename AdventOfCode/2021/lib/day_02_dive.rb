# frozen_string_literal: true

require "input_helpers"

class Day02Dive
  include InputHelpers

  attr_accessor :horizontal, :depth

  def initialize(report_filename, pII: false)
    file_to_tokens(report_filename)
      .map
      .with_object(
        {
          horizontal: 0,
          depth: 0,
          aim: 0,
        },
      ) do |command, position|
        case command
        in ["forward", number]
          position[:horizontal] += number
          position[:depth] += number * position[:aim] if !position[:aim].zero? && pII
        in ["down", number]
          position[:aim] += number
          position[:depth] += number unless pII
        in ["up", number]
          position[:aim] -= number
          position[:depth] -= number unless pII
        else
          raise ArgumentError, "don't know how to handle #{command.inspect}"
        end
      end.tap do |result|
        @horizontal = result[:horizontal]
        @depth = result[:depth]
      end
  end

  def perform
    @horizontal * @depth
  end
end
