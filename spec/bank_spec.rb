require 'bank'

describe Bank do
  let(:account) { Bank.new }
  let(:account_with_balance) { Bank.new(100) }
  let(:date) { Time.new.strftime("%d/%m/%Y") }
  
  
  it 'balance is correctly summed after deposits and withdrawals' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.balance).to eq 2500
  end
  
  
  describe '#deposit' do
    it 'doesn\'t allow a debit/negative deposit' do
      expect { subject.deposit(-100) }.to raise_error "This isn't a valid deposit"
    end 
  end

  describe '#withdraw' do
    it 'prevents the account becoming overdrawn' do
      expect { account.withdraw(50) }.to raise_error "Unable to enter overdraft"
    end

    it 'prevents a negative value being passed' do
      expect { account_with_balance.withdraw(-1) }.to raise_error "Invalid value"
    end
  end

  describe '#activity' do
    it 'stores bank activity' do
      account.deposit(500)
      account.withdraw(100)
      expect(account.transactions).to eq([[date, 500, nil, 500], [date, nil, 100, 400]])
    end
  end
end
