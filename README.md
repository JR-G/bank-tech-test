Bank Tech Test
===

Instructions
---
### Project Setup
```
$ git clone https://github.com/JR-G/bank-tech-test
$ bundle
```

### Testing
```
$ rspec
$ rubocop
```

### Running the App
Launching it
```
$ irb
```
Creating a new account (it can also take an optional argument of an opening balance)
```
$ account = Bank.new / Bank.new(100)
```
To make a deposit
```
$ account.deposit(100)
```
To make a withdrawal
```
$ account.withdraw(50)
```
To view your statement
```
$ account.statement

date || credit || debit || balance
 05/10/2020 ||  || 50 || 50
 05/10/2020 || 100 ||  || 100
```
Approach
---
### Solution
I used a TDD Red, Green, Refactor approach to complete this tech test. I wanted to keep each class and the methods as simple as possible, whilst maintaining readability.

I also decided to use SimpleCov and Rubocop to ensure my tests had good coverage and that my code had a clean and consistent style throughout.

### User Stories
```
As a customer,
So that I can manage my money
I want to be able to open a bank account.
```
```
As a customer,
So that I can save my money
I want to be able to make deposits into my account
```
```
As a customer,
So that I can use my money
I want to be able to make withdrawals from my account

```
```
As a bank,
So that a customer can view their account history
I want to be able to correctly store their transactions
```
```
As a customer,
So that I can view my transactions
I want to be able to print a bank statement
```


### Structure
| Class | Purpose |
| ----- | ------- |
| Bank  |  Allows the user to create an account and deposit, withdraw funds and view a statement    |
| Ledger | Stores the transactions |
| Statement | Constructs the printed statement  |


Next Steps
---
My Bank class is currently quite big and holds a lot of logic. I'd next look to improve this class. I'd also improve the tests in ```ledger_spec.rb``` I'm conscious these may be testing for state rather than behaviour.