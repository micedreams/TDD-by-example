require "spec_helper"

describe "Unit Test of Application" do
  it "test  multiplication" do
    five = Money.dollar(5)

    expect(five * 2).to eq(Money.dollar(10))

    expect(five * 3).to eq(Money.dollar(15))
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
    five = Money.dollar(5)
    sum = five + five
    bank = Bank.new
    reduced = bank.reduce(sum, "USD")
    expect(Money.dollar(10)).to eq(reduced)
  end

  it "test + returns sum" do
    five = Money.dollar(5)
    result = five + five
    expect(five).to eq(result.augend)
    expect(five).to eq(result.addend)
  end

  it "test reduce sum" do
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, "USD")
    expect(Money.dollar(7)).to eq(result)
  end

  it "test reduce money" do
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), "USD")
    expect(Money.dollar(1)).to eq(result)
  end

  it "test reduce money different currency" do
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    result = bank.reduce(Money.franc(2), "USD")
    expect(Money.dollar(1)).to eq(result)
  end

  it "test mixed addition" do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    result = bank.reduce(five_bucks + ten_francs, "USD")
    expect(Money.dollar(10)).to eq(result)
  end

  it "test sum + money" do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    sum = Sum.new(five_bucks, ten_francs) + five_bucks
    result = bank.reduce(sum, "USD")
    expect(Money.dollar(15)).to eq(result)
  end

  it "test sum times" do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    sum = Sum.new(five_bucks, ten_francs) * 2
    result = bank.reduce(sum, "USD")
    expect(Money.dollar(20)).to eq(result)
  end

  it "test if + returns same currency" do
    sum = Money.dollar(1) + Money.dollar(1)
    bank = Bank.new
    result = sum.reduce(bank, "USD")
    expect(result.class).to eq(Money)
  end
end
