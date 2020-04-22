require "spec_helper"

describe "Unit Test of Application" do
  it "multiplication" do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eq(10)
  end

  it "test another multiplication" do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eq(10)
    product = five.times(3)
    expect(product.amount).to eq(15)
  end

  it "test equality" do
    expect(Dollar.new(5)).to eq(Dollar.new(5))
    expect(Dollar.new(5)).not_to eq(Dollar.new(6))
  end
end
