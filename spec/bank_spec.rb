require 'bank'

describe Bank do
  let(:account) { Bank.new }
  let(:account_with_balance) { Bank.new(100) }
  let(:date) { Time.new.strftime("%d/%m/%Y") }
  
  describe '#deposit' do
    it 'increases balance after a deposit' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end

    it 'doesn\'t allow a debit/negative deposit' do
      expect { subject.deposit(-100) }.to raise_error "This isn't a valid deposit"
    end 
  end

  describe '#withdraw' do
    it 'decreases balance after a withdrawal' do
      account_with_balance.withdraw(50)
      expect(account_with_balance.balance).to eq 50
    end

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
