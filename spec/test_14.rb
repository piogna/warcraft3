require_relative 'spec_helper'

describe Barracks do
  before :each do
    @b = Barracks.new
  end
  it "have a lumber attribute" do
    expect{@b.lumber}.not_to raise_error(NoMethodError)
  end

  it "should be initialized with 500 lumber" do
    expect(@b.lumber).to eq(500)
  end
end
