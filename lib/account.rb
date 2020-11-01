class Account
    def initialize(account_id, initial_balance)
      @account_id = account_id
      @initial_balance = initial_balance
      @transactions = []
    end

    def add_transactions(transaction_list)
        transaction_list.each do |transaction|
           if transaction[:account_id] = @account_id
                @transactions.push(transaction[:value])
           end
        end
    end

    def balance
        balance = @initial_balance
        @transactions.each do |transaction|
            balance += transaction
            # Apply the negative charge for withdraw with negative balance
            if transaction.negative? && balance.negative?
                balance -= 300
            end
        end
        return balance
    end

    attr_accessor :account_id, :initial_balance
end