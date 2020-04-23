class Money
  attr_reader :amount

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(money)
    amount == money.amount && money.class == self.class
  end

  def self.dollar(amount)
    Dollar.new(amount, "USD")
  end

  def self.franc(amount)
    Franc.new(amount, "CHF")
  end

  def times(multiplier)
  end

  def currency
    @currency
  end
end
