require_relative 'write_functions'

class Player


  attr_accessor :name, :life_points

  def initialize(name_to_save)
    @name = name_to_save.to_s
    @life_points = 10
  end

  def show_state
  puts "#{name} à #{life_points} points de vie"
  end
  
  def gets_damage(damage)
    @life_points -= damage.to_i
    if @life_points <= 0
      puts "le joueur #{name} tombe au sol !"  
    end
  end


  def compute_damage
    return rand(1..6)
  end

  def attacks(player)
    dice = compute_damage
    write_blink("#{name} attaque #{player.name} et inflige #{dice} points de dommages", 0.2, 4)
    player.gets_damage(dice)
  end


end


class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name_to_save)
    @name = name_to_save.to_s
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{name} à #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = compute_damage
    puts "Tu as trouvé une arme de niveau #{dice}"
    if dice > @weapon_level
      then @weapon_level = dice
      puts "Elle est meilleure (BROKEN) : tu la saisis !"
    else
      puts "Elle n'est pas mieux...MAIS VOILA MAIS C'ETAIT SUR EN FAIT ! C'ETAIT SUR !!! (bruit de cassage de clavier)" #Sardoche sort de ce corps
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "HAHA ! try again noob"
    elsif dice > 1 && dice < 6
      puts "Allez hop, +50 HP"
      if @life_points + 50 > 100
        @life_points = 100
      else
        @life_points += 50
      end
    else
      puts "JUNGLE DIFF! tu reprends +80 HP"
      if @life_points + 80 > 100
        @life_points = 100
      else
        @life_points += 80
      end
    end
  end
end

      


