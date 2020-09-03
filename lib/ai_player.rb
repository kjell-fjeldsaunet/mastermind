require 'set'
require_relative 'match_score'

# Generate code and make guess
class AIPlayer
  COLORS = 'rgbypo'.chars

  attr_accessor :current_match_score, :guess, :possible_answers, :score, :name
  def initialize
    @name = 'Computer'
    @guess = ''
    @score = 0
    @all_answers = COLORS.product(*Array.new(3) { COLORS }).map(&:join)
    # creating a hash where a possible answer is the key. The value is a hash where the key is another answer and the
    # value is the resulting current_match_score of of the two keys
    # Example with reduced code:
    # {'11' => {
    #   '11' => {'exact' => 2, 'color_only' => 0},
    #   '12' => {'exact' => 1, 'color_only' => 0},
    #   '21' => {'exact' => 1, 'color_only' => 0},
    #   '22' => {'exact' => 0, 'color_only' => 0},
    #    }
    # }
    # Now we can reduce the number of possible answers by removing all answers with scores that do not match
    # the actual current_match_score of current guess.
    @all_scores = Hash.new { |guess, answer| guess[answer] = {} }
    @all_answers.product(@all_answers).each do |combination|
      @all_scores[combination[0]][combination[1]] = MatchScore.calculate_score(combination[0].chars, combination[1].chars)
    end
    @all_answers = @all_answers.to_set
    @possible_answers = @all_answers.dup
  end

  def make_guess(round, match_score = {})
    if round > 1
      @possible_answers.keep_if { |answer| @all_scores[@guess][answer] == match_score }
      @guess = @possible_answers.to_a.sample
    else
      @guess = 'rrgg'
      @possible_answers = @all_answers.dup # Reset pool of answers so it can be used in the next guess
    end
    @guess.chars
  end

  def make_code
    Array.new(4).map { COLORS[rand(6)] }
  end
end
