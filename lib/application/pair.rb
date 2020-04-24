class Pair
  attr_reader :to_currency, :from_currency

  def initialize(from_currency, to_currency)
    @from_currency = from_currency
    @to_currency = to_currency
  end

  def hash
    @from_currency.hash ^ @to_currency.hash
  end

  def eql?(other_prair)
    to_currency == other_prair.to_currency && from_currency == other_prair.from_currency
  end

  def ==(other_prair)
    eql?(other_prair)
  end
end
