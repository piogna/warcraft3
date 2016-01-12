require_relative 'spec_helper'

describe SiegeEngine do
  before :each do
    @e = SiegeEngine.new
  end
  it "should inherit from Unit" do
    expect(@e.class.superclass.name).to eq("Unit")
  end

  it "should have 50 attack power on initialization" do
    expect(@e.attack_power).to eq(50)
  end

  it "should have 400 health points on initialization" do
    expect(@e.health_points).to eq(400)
  end

  describe "#attack!" do
    it "should do double damage to barracks" do
      b = Barracks.new
      @e.attack!(b)
      expect(b.health_points).to eq(400)
    end

    it "should do regular damage to siege engines" do
      se = SiegeEngine.new
      @e.attack!(se)
      expect(se.health_points).to eq(350)
    end

    it "should not be able to attack footmen" do
      f = Footman.new
      @e.attack!(f)
      expect(f.health_points).to eq(60)
    end
    it "should not be able to attack peasants" do
      p = Peasant.new
      @e.attack!(p)
      expect(p.health_points).to eq(35)
    end
  end
end

describe Barracks do
  before :each do
    @b = Barracks.new
  end
  describe "#can_build_siege_engine?" do
    it "should respond to #can_build_siege_engine?" do
      expect {@b.can_build_siege_engine?}.not_to raise_error
      expect {@b.can_build_siege_engine?}.not_to raise_error(NoMethodError)
    end

    it "#can_build_siege_engine? shpuld return true if requirements are met" do
      expect(@b.can_build_siege_engine?).to be_truthy
    end

    it "#can_build_siege_engine? should return false if requirements aren't met" do
      allow(@b).to receive(:gold).and_return(199)
      expect(@b.can_build_siege_engine?).to be_falsey
    end
  end
  describe "#build_siege_engine" do
    it "should return a siege engine when requirements are met" do
      expect(@b.build_siege_engine).to be_an_instance_of(SiegeEngine)
    end

    it "should not return a siege engine when requirements are not met" do
      allow(@b).to receive(:gold).and_return(199)
      expect(@b.build_siege_engine).to be_nil
    end
  end
end
