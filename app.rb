require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)

require 'player' 
require 'boardcase'
require 'board'
require 'application'


puts

"------------------ Prêt(e) pour le super morpion ? --------------------------------"


player1 = Player.new
player2 = Player.new


puts "Avant toute chose, commençons par toi !"

player1.intro

puts "C'est maintenant au tour de player2 de se présenter !" 

player2.intro

puts "Super, nous avons maintenant nos deux joueurs #{player1.name}, et #{player2.name}. La super partie peut commencer ;)"

game = Application.new(player1,player2)

game.perform

