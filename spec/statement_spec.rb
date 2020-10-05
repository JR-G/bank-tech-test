require 'statement'

describe Statement do
  let(:account) { Bank.new }
  let(:date) { Time.new.strftime("%d/%m/%Y") }

  it 'prints out a statement' do
    expect { subject.print_out() }.to output("date || credit || debit || balance\n").to_stdout 
  end

  it 'prints out activity' do
    account.deposit(500)
    account.withdraw(100)
    expect { subject.print_out(account.activity) }.to output("date || credit || debit || balance\n #{date} ||  || 100 || 400\n #{date} || 500 ||  || 500\n").to_stdout 
  end
end
