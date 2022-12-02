# frozen_string_literal: true

require "input_helpers"
class Day02RockPaperScissors
  include InputHelpers

  def rps_value(play) = %w[X Y Z].index(play) + 1

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
        score = 0
        you_play = play_algo.call(oponent, you)
        score += rps_value(you_play)
        score += 3 if DRAW_HASH[oponent] == you_play
        score += 6 if WIN_HASH[oponent] == you_play
        score
      end.sum
  end
end
