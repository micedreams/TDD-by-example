class Money
  attr_reader :amount

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(money)
    amount == money.amount && money.currency == currency
  end

  def self.dollar(amount)
    Money.new(amount, "USD")
  end

  def self.franc(amount)
    Money.new(amount, "CHF")
  end

  def times(multiplier)
    nil
  end

  def currency
    @currency
  end

  def *(multiplier)
    Money.new(amount * multiplier, @currency)
  end

  def +(addend)
    Sum.new(self, addend)
  end

  def reduce(bank, to_currency)
    rate = bank.rate(currency, to_currency)
    Money.new(amount / rate, to_currency)
  end
end
