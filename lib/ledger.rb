class Ledger
  attr_reader :transactions
  
  def initialize
    @transactions = []
  end

  def credit(date, amount, balance)
    @transactions << [date, amount, nil, balance]
  end

  def debit(date, amount, balance)
    @transactions << [date, nil, amount, balance]
  end

end
