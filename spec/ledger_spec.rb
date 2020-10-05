require 'ledger'

describe Ledger do
  let(:ledger) { Ledger.new }
  let(:date) { Time.new.strftime("%d/%m/%Y") }

  it 'stores transactions' do
    ledger.credit(date, 100, 100)
    ledger.debit(date, 30, 70)
    expect(ledger.transactions).to eq([[date, 100, nil, 100], [date, nil, 30, 70]])
  end
end
