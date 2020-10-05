class Bank

  attr_reader :balance, :activity

  def initialize(balance = 0)
    @balance = balance
    @activity = []
  end

  def deposit(amount, date = Time.new.strftime("%d/%m/%Y"))
    fail "This isn't a valid deposit" if negative?(amount)

    @balance += amount
    @activity << [date, amount, nil, balance]
  end

  def withdraw(amount, date = Time.new.strftime("%d/%m/%Y"))
    fail "Invalid value" if negative?(amount)
    fail "Unable to enter overdraft" if negative?(balance - amount)

    @balance -= amount
    @activity << [date, nil, amount, balance]
  end

  private
  def negative?(amount)
    amount.negative?
  end
end
