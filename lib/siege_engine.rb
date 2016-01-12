class SiegeEngine < Unit

  def initialize
    @attack_power = 50
    @health_points = 400
  end

  def attack!(enemy)
    unless dead?
      if enemy.class.name == "Barracks"
        enemy.take_damage(attack_power * 2)
      elsif enemy.class.name == "SiegeEngine"
        super enemy
      end
    end
  end
end
