require 'bank'

describe 'Bank account features' do
  it 'returns the expected statement of the acceptance test' do
    account = Bank.new
    date = Time.new.strftime("%d/%m/%Y")
    account.deposit(1000, date)
    account.deposit(2000, date)
    account.withdraw(500, date)
    expect { account.statement }.to output("date || credit || debit || balance\n #{date} ||  || 500 || 2500\n #{date} || 2000 ||  || 3000\n #{date} || 1000 ||  || 1000\n").to_stdout
  end
end