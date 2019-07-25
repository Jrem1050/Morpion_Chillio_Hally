require "pry"
require"colorize"

$:.unshift File.expand_path("./../lib", __FILE__)
require "player"
require "game"

players = Player.new #initialize Players

#initialize Players names and signs
player1_name = players.player1_name
player1_sign = players.player1_sign
player2_name = players.player2_name
player2_sign = players.player2_sign

#initialize number of games
games_count = 1

#initialize game
game = Game.new(player1_name, player1_sign, player2_name, player2_sign, games_count)

#perform game
game.full_game