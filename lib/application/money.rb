class Money
  attr_reader :amount

  def ==(money)
    amount == money.amount && money.class == self.class
  end

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end

  def times(multiplier)
      
  end
end
