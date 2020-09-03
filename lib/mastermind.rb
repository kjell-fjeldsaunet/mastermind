# frozen_string_literal: true

require_relative 'game'
require_relative 'loading_screen'

playing = true
games_played = 0
player_name = ''
while playing
  print 'Booting up the AI '
  game = nil
  LoadingScreen.show_loading_dots { game = Game.new }
  unless games_played.positive?
    puts game.welcome
    puts game.instructions
    puts game.valid_code
    print game.ask_name
    player_name = gets.chomp
  end
  game.name_player(player_name)
  start_order = [game.ai_player, game.ai_player]
  start_order[game.player.ask_starting_role] = game.player
  (1..game.number_of_rounds).each do |round|
    game.play_round(start_order[0], start_order[1], round)
    start_order = game.switch_roles(start_order)
  end
  print game.play_again
  playing = gets.chomp.downcase == 'yes'
  games_played += 1
end
# Create game
# puts welcome message
# puts rules/intro
# gets name of player
# create player
# create computer
# playing = true
# while playing
#  get number of rounds: even
#  if CM/CB not decided:
#   ask if player wants to start as CM or CB
#  CB:
#    computer generates code
#    save code
#    Loop until all guesses are used:
#      get guess from player
#      check guess
#      if win or all guesses used:
#        break out of loop
#        add number of guesses used to CM score
#        put out message of win/fail
#      else
#        give feedback
#    if more rounds left:,
#      change CM and CB
#      loop back around
#    else:
#      break out
#      give total score
#      ask if want to go again
#      No:
#        playing = false
#      yes:
#        playing = true (no change)
#  CM:
#   get code from player
#   save secret code
#   get guess from AI
#   while guess != secret code and guesses not used up
#     give feedback to AI
#     Make new guess
#     compare guess and code
#   save number of guesses as score for CM
#
