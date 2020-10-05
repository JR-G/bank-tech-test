require_relative 'bank'

class Statement
  
  def print_out(values = false)
      if values
        values.map! { |entry| entry.join(" || ") }
        reversed_elements = values.reverse.join("\n ")
        statement = "#{header}\n #{reversed_elements}"
        puts statement
        return statement
      else header
      end
  end

  private
  def header
    "date || credit || debit || balance"
  end
end
