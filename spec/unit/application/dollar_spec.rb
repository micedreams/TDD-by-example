require "spec_helper"

describe "Unit Test of Application" do
  it "test  multiplication" do
    five = Dollar.new(5)

    expect(five.times(2)).to eq(Dollar.new(10))

    expect(five.times(3)).to eq(Dollar.new(15))
  end

  it "test equality" do
    expect(Dollar.new(5)).to eq(Dollar.new(5))
    expect(Dollar.new(5)).not_to eq(Dollar.new(6))
  end

  it "test Franc multiplication" do
    five = Franc.new(5)

    expect(five.times(2)).to eq(Franc.new(10))

    expect(five.times(3)).to eq(Franc.new(15))
  end
end
