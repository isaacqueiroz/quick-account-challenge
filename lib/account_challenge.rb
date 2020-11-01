require 'csv'
require 'account'
class AccountChallenge
    def self.read_account_input(input)
        @accounts_list = CSV.new(input, headers: ["account_id","initial_balance"], :header_converters => :symbol, :converters => :all).to_a.map {|row| row.to_hash }
    end

    def self.read_transaction_input(input)
        @transactions_list = CSV.new(input, headers: ["account_id","value"], :header_converters => :symbol, :converters => :all).to_a.map {|row| row.to_hash }
    end

    def self.print_balances
        @accounts = []
        # Create relevant accounts
        @accounts_list.each do |account|
            @accounts.push(Account.new(account[:account_id], account[:initial_balance]))
        end
        # Map account transactions
        @accounts.each do |account|
            transactions = @transactions_list.select { |t| t[:account_id] == account.account_id }
            account.add_transactions(transactions)
        end
        
        @accounts.each do |account|
            puts account.account_id
            puts account.balance
        end
    end
end