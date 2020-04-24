class Bank
    attr_reader :rates
  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def rate(from_currency, to_currency)
    return 1 if to_currency == from_currency

    rates[Pair.new(from_currency, to_currency)]
  end

  def add_rate(from_currency, to_currency, rate)
    @rates[Pair.new(from_currency, to_currency)] = rate
  end
end
