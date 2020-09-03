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
