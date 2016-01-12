# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  def initialize
    @health_points = 60
    @attack_power = 10
  end

  def attack!(enemy)
    if enemy.class.name == "Barracks" && !dead?
      enemy.take_damage((attack_power / 2).to_i)
    else
      super enemy
    end
  end
end
