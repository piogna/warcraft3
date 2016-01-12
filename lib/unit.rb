class Unit
  attr_reader :health_points, :attack_power
  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    unless dead? || enemy.dead?
      enemy.take_damage(attack_power)
    end
  end

  def take_damage(damage)
    @health_points -= damage
  end

  def dead?
    health_points <= 0
  end
end
