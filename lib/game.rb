# frozen_string_literal: true

require_relative 'ai_player'
require_relative 'player'
require_relative 'game_board'
require_relative 'messages'
require_relative 'match_score'
# Keep score, count rounds and contain all game-parts
class Game
  include Messages
  attr_accessor :number_of_rounds, :player, :ai_player
  def initialize
    @rounds_played = 0
    @number_of_rounds = 4
    @ai_player = AIPlayer.new
    @player = Player.new
  end

  def name_player(name)
    @player.name = name
  end

  def play_round(codemaker, codebreaker, round)
    @round_score = 0
    puts "\n\nRound #{round}!\n\n#{codemaker.name} is the codemaker.\n\n"
    secret_code = codemaker.make_code
    p "debugging mode: secret code: #{secret_code}"
    @guess = nil
    match_score = {}
    while @guess != secret_code && @round_score < 13
      @round_score += 1
      @guess = codebreaker.make_guess(@round_score, match_score)
      match_score = MatchScore.calculate_score(@guess, secret_code)
      puts "#{codebreaker.name} guessed #{@guess}. It had #{match_score['exact']} exact matches and "\
      "#{match_score['color_only']} correct colors.\nOnly #{12 - round_score} guesses left!"
    end
    puts "#{codebreaker.name} used #{@round_score} guesses. " # Add points modifier: 13 points if it is not guessed
    puts "#{codemaker.name} gets #{@round_score} points!"
    codemaker.score = @round_score
    @rounds_played += 1
  end

  def switch_roles(array)
    placeholder = array[0]
    array[0] = array[1]
    array[1] = placeholder
    array
  end
end
