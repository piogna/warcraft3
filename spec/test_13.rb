require_relative 'spec_helper'

describe "Dead Units" do
  before :each do
    @u = Unit.new(50,50)
    @e = Unit.new(50,50)
  end
  it "should not be able to #attack!" do
    allow(@u).to receive(:health_points).and_return(0)
    @u.attack!(@e)
    expect(@e.health_points).to eq(50)
  end

  it "should not be able to be attacked by an enemy" do
    en = Unit.new(0,0)
    @u.attack!(en)
    expect(en.health_points).to eq(0)
  end
end
