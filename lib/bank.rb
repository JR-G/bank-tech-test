require_relative 'ledger'
class Bank

  attr_reader :balance, :transactions, :ledger

  def initialize(balance = 0)
    @balance = balance
    @ledger = Ledger.new
    @transactions = ledger.transactions
  end

  def deposit(amount, date = Time.new.strftime("%d/%m/%Y"))
    fail "This isn't a valid deposit" if negative?(amount)

    @balance += amount
    ledger.credit(date, amount, balance)
  end

  def withdraw(amount, date = Time.new.strftime("%d/%m/%Y"))
    fail "Invalid value" if negative?(amount)
    fail "Unable to enter overdraft" if negative?(balance - amount)

    @balance -= amount
    ledger.debit(date, amount, balance)
  end

  private
  def negative?(amount)
    amount.negative?
  end
end
