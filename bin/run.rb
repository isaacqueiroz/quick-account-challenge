#!/usr/bin/env ruby
require_relative '../lib/account_challenge'
require 'csv'

if ARGV.length < 2
    puts "Invalid number of arguments! Please review and try again."
else
    accounts_file = File.open(ARGV[0])
    transaction_file = File.open(ARGV[1])
    @account_engine = AccountChallenge.new
    @account_engine.read_account_input(accounts_file.read)
    @account_engine.read_transaction_input(transaction_file.read)
    accounts_file.close
    transaction_file.close
    @account_engine.print_balances
end