require 'bank'

describe Bank do
  let(:account) { Bank.new }
  
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
      account_with_balance = Bank.new(100)
      account_with_balance.withdraw(50)
      expect(account_with_balance.balance).to eq 50
    end
  end
end
