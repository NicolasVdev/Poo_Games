require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/write_functions'

def clear_screen_short
  system("clear")
end

def init
  clear_screen_short
  progress_bar = "█"
  progress_bar_lenght = 81
  
  write("Lancement du jeu en cours")
  write_long("...\n")
  write("#{progress_bar * progress_bar_lenght} 100%\n\n")
  printf "██████████████████████████████████████████████████████████████████████████████████████\n"
  printf "████████████████████████████  WELCOME TO LEAGUE OF CANCER  ███████████████████████████\n"
  printf "██████████████████████████████████████████████████████████████████████████████████████\n"
  
  printf "\n\n                   Une seule règle : SURVIVRE (au chat nottament) !               \n\n"
end

def init_2
  clear_screen_short
  progress_bar = "█"
  progress_bar_lenght = 81
  
  write("Chargement de la game")
  write_long("...\n")
  write("#{progress_bar * progress_bar_lenght} 100%\n")
  puts ""
end

puts init
# puts "-------------------------------------------------"
# puts "|         WELCOME TO LEAGUE OF CANCER !          |"
# puts "|         le but... survivre au chat !           |"
# puts "-------------------------------------------------"
write_line("Quel type de pokemon es-tu ? (en gros c'est quoi ton petit nom)", 0.02) #POKERAP
print "> "
psedo = gets.chomp.to_s
player1 = HumanPlayer.new("#{psedo}")

bot1 = Player.new("Josiane")
bot2 = Player.new("José")
enemies = [bot1, bot2]
puts ""
puts "Statistiques actuelles de notre héros du jour :"
print "> "
puts "#{player1.show_state}"
puts ""
puts "Statistiques des valeureux adversaires (noobs) en face :"
print "> "
puts "#{bot1.show_state}"
print "> "
puts "#{bot2.show_state}\n\n"
puts "-----------------------------------------------------------\n\n"
puts "Appuie sur entrée pour démarrer la partie"
gets.chomp
puts init_2
while player1.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0)
  puts "-----------------------------------------------------------\n\n"
  puts "Petit rappel de la situation : \n\n"
  print "> "
  puts "#{player1.show_state}"
  print "> "
  puts "#{bot1.show_state}"
  print "> "
  puts "#{bot2.show_state}\n\n"
  puts "-----------------------------------------------------------\n\n"
  puts "Que veux tu faire jeune padawan ?\n\n"
  puts "1 - obtenir un meilleur stuff ⚔️\n"
  puts "2 - te soigner ❤️\n"
  puts "3 - gank mid obviously 🤜\n\n"
    choice = gets.chomp

      if choice == "1"
        player1.search_weapon
      elsif choice == "2"
        player1.search_health_pack
      elsif choice == "3"
        puts ""
        puts "Excellent choix !\n\n"
        # puts "#{bot1.show_state}"
        # puts "veux tu la/le soulever ?\n\n" 
        # # puts "#{bot2.show_state}"
        # puts "ou scope #{bot2.show_state}\n\n"
        puts "Press 1 pour soulever #{bot1.name} ou 2 pour scope #{bot2.name}"
          input = gets.chomp
          if input == "1"
            player1.attacks(bot1) 
              # if bot1.life_points >= 0 
              # else puts "#{bot1.name} est déjà mort(e) !"
              # end
          elsif input == "2"
            player1.attacks(bot2) 
            # if bot2.life_points >= 0 
            # else puts "#{bot2.name} est déjà mort(e) !"
            # end
          end
      end
  puts "-----------------------------------------------------------\n\n"
  sleep (0.5)
  puts "Au tour des noobs !"
  enemies.each do |bot|
    if bot.life_points > 0
      bot.attacks(player1)
      sleep (0.5)
    end
  end
  system('cls') || system('clear')    
end
puts "-----------------------------------------------------------\n\n"
puts "La partie est finnie !\n\n"
if player1.life_points > 0 
  printf "██████████████████████████████████████████████████████████████████████████████████████\n"
  printf "████████████████████████████    🔥  V I C T O R Y !   🔥   ███████████████████████████\n"
  printf "██████████████████████████████████████████████████████████████████████████████████████\n"
else
  printf "██████████████████████████████████████████████████████████████████████████████████████\n"
  printf "███████████████████████████     ☠️  YOU... LOSE ! ☠️     ████████████████████████████\n"
  printf "██████████████████████████████████████████████████████████████████████████████████████\n"
end

# binding.pry