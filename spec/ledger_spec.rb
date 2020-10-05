require 'ledger'

describe Ledger do
  let(:account) { Bank.new }
  let(:date) { Time.new.strftime("%d/%m/%Y") }

  it 'stores transactions' do
    account.deposit(100)
    account.withdraw(50)
    expect(subject.transactions).to eq([[date, 100, nil, 100], [date, nil, 50, 70]])
  end
end
