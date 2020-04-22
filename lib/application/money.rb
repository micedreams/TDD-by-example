class Money
  attr_reader :amount

  def ==(money)
    amount == money.amount && money.class == self.class
  end
end
