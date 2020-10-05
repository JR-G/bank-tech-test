require 'bank'

describe Bank do
  let(:account) { Bank.new }
  
  describe '#deposit' do
    it 'increases balance to 500 after a deposit of 500' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end

    it 'doesn\'t allow a debit/negative deposit' do
      expect { subject.deposit(-100) }.to raise_error "This isn't a valid deposit"
    end 
  end
end
