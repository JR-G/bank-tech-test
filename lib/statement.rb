require 'bank'

class Statement
  def print_out
    header
  end

  private
  def header
    "date || credit || debit || balance"
  end
end
