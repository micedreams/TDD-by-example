require "spec_helper"

describe "Unit Test of Application" do
  it "multiplication" do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq(10)
  end
end
