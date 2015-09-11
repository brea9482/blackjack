#!/usr/bin/env ruby
require_relative "../lib/card"
require_relative "../lib/deck"
require_relative "../lib/game"
require_relative "../lib/hand"

require "pry"

puts "Welcome to BlackJack! \n\n"
game = Game.new
game.start
game.deck.count("player_hand")
game.player_result
answer = gets.chomp.upcase

i = 2
while answer == 'Y'
  game.player_choices(i)
  i += 1
  break if game.deck.count("player_hand") >= 21
  answer = gets.chomp.upcase
end

if answer == 'N'
  game.game_wrapup
end
