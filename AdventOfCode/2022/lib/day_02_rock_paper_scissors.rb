# frozen_string_literal: true

require "input_helpers"
class Day02RockPaperScissors
  include InputHelpers

  def rps_value(play) = %w[X Y Z].index(play) + 1
  def draw_value(oponent, play) = DRAW_HASH[oponent] == play ? 3 : 0
  def win_value(oponent, play) = WIN_HASH[oponent] == play ? 6 : 0

  DRAW_HASH = %w[A B C].zip(%w[X Y Z]).to_h
  LOOSE_HASH = %w[A B C].zip(%w[Z X Y]).to_h
  WIN_HASH = %w[A B C].zip(%w[Y Z X]).to_h

  # algo PI second column decides what to play
  PLAY_ALGO_PI = lambda { |oponent, you| you }

  # algo PII second column decides if you draw/loose/win
  PLAY_ALGO_PII = lambda { |oponent, you|
    {
      "Y" => DRAW_HASH,
      "X" => LOOSE_HASH,
      "Z" => WIN_HASH,
    }[you][oponent]
  }

  def perform(input_filename)
    calculate(input_filename, PLAY_ALGO_PI)
  end

  def perform_pII(input_filename)
    calculate(input_filename, PLAY_ALGO_PII)
  end

  def calculate(input_filename, play_algo)
    file_to_tokens(input_filename)
      .map do |oponent, you|
        you_play = play_algo.call(oponent, you)

        rps_value(you_play) +
          draw_value(oponent, you_play) +
          win_value(oponent, you_play)
      end.sum
  end
end
