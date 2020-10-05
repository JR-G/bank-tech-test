class Bank

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    fail "This isn't a valid deposit" if amount.negative?

    @balance += amount

  end
end
