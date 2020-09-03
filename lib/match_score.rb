# frozen_string_literal: true

# Module to hold method for evaluation of guess
module MatchScore
  def self.calculate_score(attempt, answer)
    color_only = find_correct_colors(attempt, answer)
    exact_matches = find_exact_matches(attempt, answer)
    {
      'exact' => exact_matches,
      'color_only' => color_only - exact_matches
    }
  end

  def self.find_correct_colors(attempt, answer)
    (attempt & answer).flat_map { |color| [color] * [attempt.count(color), answer.count(color)].min }.size
  end

  def self.find_exact_matches(attempt, answer)
    exact_match = 0
    attempt.each_with_index do |color, index|
      exact_match += 1 if color == answer[index]
    end
    exact_match
  end
end

# p MatchScore.calculate_score(%w[r r r r], %w[r r g r])
# p MatchScore.calculate_score(%w[r r r r], %w[y y y y])
# p MatchScore.calculate_score(%w[r g b y], %w[b g y r])
# p MatchScore.calculate_score(%w[r p b y], %w[b g y r])
# p MatchScore.calculate_score(%w[r r r r], %w[y r g r])
# p MatchScore.calculate_score(%w[r r r r], %w[r r g r])
# p MatchScore.find_correct_colors([1, 2, 4, 5, 4, 7], [2, 5, 4, 4])
