require 'statement'

describe Statement do
  let(:date) { Time.new.strftime("%d/%m/%Y") }

  it 'prints out a blank statement if there are no transactions' do
    expect { subject.print_out() }.to output("date || credit || debit || balance\n").to_stdout 
  end

  it 'prints out activity' do
    transactions = [[date, 500, nil, 500], [date, nil, 100, 400]]
    expect { subject.print_out(transactions) }.to output("date || credit || debit || balance\n #{date} ||  || 100 || 400\n #{date} || 500 ||  || 500\n").to_stdout 
  end

  it 'can print out a new updated statement after another transaction' do
    transactions = [[date, 100, nil, 100]]
    subject.print_out(transactions)
    transactions << [date, nil, 30, 70]
    expect { subject.print_out(transactions) }.to output("date || credit || debit || balance\n #{date} ||  || 30 || 70\n #{date} || 100 ||  || 100\n").to_stdout 
  end
end
