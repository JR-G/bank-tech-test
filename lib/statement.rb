require_relative 'bank'

class Statement
  
  def print_out(values = false)
      if values
        statement = statement(values)
        puts statement
        return statement
      else header
      end
  end

  private
  def header
    "date || credit || debit || balance"
  end

  def statement(values)
    values.map! { |entry| entry.join(" || ") }
    joined_entries = values.reverse.join("\n ")
    "#{header}\n #{joined_entries}"
  end
end
