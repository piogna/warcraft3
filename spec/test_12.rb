require_relative "spec_helper"

describe Unit do

  before :each do
    @u = Unit.new(5,5)
  end
  describe "#dead?" do
    it "should respond to dead?" do
      expect {@u.dead?}.not_to raise_error(NoMethodError)
    end

    it "should return false if health_points > 0" do
      expect(@u.dead?).to be_falsey
    end

    it "should return true if health_points <= 0" do
      allow(@u).to receive(:health_points).and_return(0)
      expect(@u.dead?).to be_truthy
    end
  end
end
