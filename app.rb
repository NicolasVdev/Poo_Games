require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts ""
puts "NOUS NOUS RETROUVONS CE SOIR POUR UN COMBAT DE FOOOOOOOLIE ENTRE"
puts "(son : roulement de tambour)" #tout est dans la tête !
puts "LE CHAMPION EN TITRE : #{player2.name} et LE CHALLENGER #{player1.name}"
puts ""
puts "Les combattants sont en pleine forme :"
puts "A ma droite #{player1.name}, #{player1.show_state}"
puts "A ma gauche #{player2.name}, #{player2.show_state} également"
puts ""
puts ""
puts "LET'S READY TO RUUUUUUUMBLE !!!"
puts ""
while player1.life_points > 0 && player2.life_points > 0
  puts "FIGHT !"
  player1.attacks(player2)
  if player2.life_points <= 0
    puts ""
    puts "Victoire de #{player1.name} par KO !"
    break
  end
  player2.attacks(player1)
  if player1.life_points <= 0
    puts ""
    puts "Victoire de #{player2.name} par KO !"
  end
  puts ""
  puts "Voici l'état des combattants :"
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"
  puts ""
end

puts ""
puts "DING DING DING ! FIN DU COMBAT"
puts ""
# puts "Voici l'état des joueurs après ce magnifique combat"
# puts "#{player1.show_state}"
# puts "et #{player2.show_state}"


# binding.pry