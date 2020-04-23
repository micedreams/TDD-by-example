require "spec_helper"

describe "Unit Test of Application" do
  it "test  multiplication" do
    five = Money.dollar(5)

    expect(five.times(2)).to eq(Money.dollar(10))

    expect(five.times(3)).to eq(Money.dollar(15))
  end

  it "test equality" do
    expect(Money.dollar(5)).to eq(Money.dollar(5))
    expect(Money.dollar(5)).not_to eq(Money.dollar(6))
    expect(Money.franc(5)).to eq(Money.franc(5))
    expect(Money.franc(5)).not_to eq(Money.franc(6))
    expect(Money.dollar(5)).not_to eq(Money.franc(5))
  end

  it "test Franc multiplication" do
    five = Money.franc(5)

    expect(five.times(2)).to eq(Money.franc(10))

    expect(five.times(3)).to eq(Money.franc(15))
  end

  it "test currency" do
    expect("USD").to eq(Money.dollar(1).currency)
    expect("CHF").to eq(Money.franc(1).currency)
  end
end
