require_relative "spec_helper"

describe Barracks do
  before :each do
    @b = Barracks.new
  end
  describe "health_points" do
    it "should respond to #health_points" do
      expect{@b.health_points}.not_to raise_error(NoMethodError)
    end

    it "should have 500 health_points by default" do
      expect(@b.health_points).to eq(500)
    end
  end
  describe "#take_damage" do
    it "should respond to #take_damage" do
      expect{@b.take_damage(10)}.not_to raise_error(NoMethodError)
    end

    it "should take the specified amount of damage" do
      @b.take_damage(10)
      expect(@b.health_points).to eq(490)
    end
  end
end
