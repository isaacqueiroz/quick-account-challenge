# Quick Account Challenge

## Getting Started

This is a quick CLI for an Account Movement application.

To run, first clone the project and then run the following to start up a Docker with the development/execution environment:

```
docker-compose run ruby_app
```

Inside the Docker, you can use the script inside /bin to run it. Try it with one of the examples, like below:

```
./bin/run.rb examples/contas.csv examples/transacoes.csv 
```

To run the RSpec Tests to make sure everything is as expected, run:

```
bundle exec rspec
```

## Inputs

The CLI for the programs expects 2 inputs:

1. Accounts CSV file
2. Transactions CSV file

Neither files should have headers or quotes.

The Accounts CSV file should have in each line the account number followed by the initial balance. The balance  and account number should be integers:

```
123,13052
456,25000
```

This means: Account 123 has initial balance of R$ 130.52 and Account 456 has initial balance of R$ 250.00.

The Transactions CSV file should have in each line the account number and the amount. Both are integer and the amount number can be positive (deposit) or negative (withdraw):

```
120,5000
456,-30000
``` 

Above, we have Account 123 receiving R$ 50.00 and 456 withdrawing R$ -300.00.

There's a chage for R$ 3.00 whenever a withdraw leaves the account negative.

## Output

The output is as follows:

```
120,-25600
130,-247800
```

This means Account 120 has balance of -256.00 after all transactions and charges and Account 130 has -2478.00 after all transactions and charges.

## Gem Usage

1. rspec: To guide our TDD. Ruby is beautiful for allowing us to create this Object Oriented CLI application with such little overhead. RSpec is awesome to guide us through the process of turning natural language-like tests into code.
2. byebug: Quick debugging!
