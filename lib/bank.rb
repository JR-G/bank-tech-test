require_relative 'ledger'
require_relative 'statement'

class Bank

  attr_reader :balance, :transactions, :ledger

  def initialize(balance = 0)
    @balance = balance
    @ledger = Ledger.new
    @transactions = ledger.transactions
    @activity = Statement.new
  end

  def statement
    @activity.print_out(transactions)
  end

  def deposit(amount, date = Time.new.strftime("%d/%m/%Y"))
    fail "This isn't a valid deposit" if amount.negative?

    @balance += amount
    ledger.credit(date, amount, balance)
  end

  def withdraw(amount, date = Time.new.strftime("%d/%m/%Y"))
    fail "Invalid value" if amount.negative?
    fail "Unable to enter overdraft" if (balance - amount).negative?

    @balance -= amount
    ledger.debit(date, amount, balance)
  end
end
