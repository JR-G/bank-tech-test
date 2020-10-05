require 'statement'

describe Statement do
  let(:account) { Bank.new }
  let(:date) { Time.new.strftime("%d/%m/%Y") }

  it 'prints out a statement' do
    expect(subject.print_out()).to eq "date || credit || debit || balance"
  end

  it 'prints out activity' do
    account.deposit(500)
    account.withdraw(100)
    expect(subject.print_out(account.activity)).to eq "date || credit || debit || balance\n #{date} ||  || 100 || 400\n #{date} || 500 ||  || 500"
  end
end
