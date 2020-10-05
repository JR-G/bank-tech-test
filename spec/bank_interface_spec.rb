describe Bank do
  let(:account) { Bank.new }
  
  describe '#deposit' do
    it 'increases balance to 500 after a deposit of 500' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end
  end
end
