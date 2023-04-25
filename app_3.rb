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
write_line("Quel type de pokemon es-tu ? (en gros c'est quoi ton petit nom)", 0.02) #POKERAP
print "> "
psedo = gets.chomp.to_s
puts "-----------------------------------------------------------\n\n"
puts "Appuie sur entrée pour démarrer la partie"
gets.chomp
puts init_2

my_game = Game.new(psedo)

while my_game.is_still_ongoing? == true
  my_game.show_players
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
end
my_game.end_of_game