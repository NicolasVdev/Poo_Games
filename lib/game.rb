require_relative 'player'
require_relative 'write_functions'

class Game

  attr_accessor :human_player, :enemies


  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    bot1 = Player.new("Lillian le Tyran") #Merci gigi
    bot2 = Player.new("Barbe noire")
    bot3 = Player.new("Muzan Kibutsuji")
    bot4 = Player.new("Freezer")
    @enemies = [bot1, bot2, bot3, bot4]
  end

  
def kill_player(player)
  @enemies.delete(player)
end


def is_still_ongoing?
  if @human_player.life_points > 0 && @enemies.empty? == false
    return true
  else
    return false
  end
end


def show_players
  @human_player.show_state
  puts "Il reste #{enemies.count} ennemis à tuer !"
end


def menu
  puts "-----------------------------------------------------------\n\n"
  puts "Que veux tu faire jeune padawan ?\n\n"
  puts "a - obtenir un meilleur stuff\n"
  puts "s - te soigner\n\n"
  puts "  gank mid obviously ! Choisis donc ta cible :\n\n"
  @enemies.each.with_index do |enemy, position|
    print "#{position + 1} - "
    enemy.show_state
  end
end


def menu_choice
  print "> "
  while input = gets.chomp.to_s
    break if (input == "a" || input == "s" || input == "1" || input == "2" || input == "3" || input == "4")
    puts "Tu fais fausse route !"
  end

  case input

  when "a"
    system("clear")
    @human_player.search_weapon
    
  when "s"
    system("clear")
    @human_player.search_health_pack

  when "1", "2", "3", "4"
    system("clear")
    input = input.to_i
    while input > @enemies.length
      puts "Tu l'as déja tué ! Choisis donc un nombre inférieur ou égal à #{@enemies.length}..."
      input = gets.chomp.to_i
    end
    @human_player.attacks(@enemies[input - 1])
    puts "-----------------------------------------------------------\n\n"
    if @enemies[input - 1].life_points <= 0
      kill_player(@enemies[input - 1])
    end
  end
end


def enemies_attack
  @enemies.each do |enemy|
    if enemy.life_points > 0
    enemy.attacks(@human_player)
    end
  end
  system('cls') || system('clear')  
end


def end_of_game
  puts "-----------------------------------------------------------\n\n"
  puts "La partie est finnie !"
  if player1.life_points > 0 
    puts "V I C T O R Y !    #EZ"
  else
    puts "YOU... LOSE !     #CHEH"
  end
end


end

