class Bank

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    fail "This isn't a valid deposit" if negative?(amount)

    @balance += amount
  end

  def withdraw(amount)
    fail "Unable to enter overdraft" if negative?(balance - amount)

    @balance -= amount
  end

  private
  def negative?(amount)
    amount.negative?
  end
end
