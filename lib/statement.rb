require_relative 'bank'

class Statement
  
  def print_out(transactions = false)
    puts transactions ? construct_statement(transactions) : header 
  end

  private
  def header
    "date || credit || debit || balance"
  end

  def construct_statement(values)
    transactions = values.map { |entry| entry.join(" || ") }
    joined_transactions = transactions.reverse.join("\n ")
    "#{header}\n #{joined_transactions}"
  end
end
