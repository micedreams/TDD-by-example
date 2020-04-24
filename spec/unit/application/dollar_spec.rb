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

    expect(Money.dollar(5)).not_to eq(Money.franc(5))
  end

  it "test currency" do
    expect("USD").to eq(Money.dollar(1).currency)
    expect("CHF").to eq(Money.franc(1).currency)
  end

  it "test simple addition" do
    sum = Money.dollar(5).+(Money.dollar(5))
    expect(sum).to eq(Money.dollar(10))
    
    five = Money.dollar(5)
    sum = five.+(five)
    bank = Bank.new
    reduced = bank.reduce(sum,"USD")
    expect(Money.dollar(10)).to eq(reduced)
  end
end
