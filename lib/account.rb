class Account
    def initialize(account_id, initial_balance)
      @account_id = account_id
      @initial_balance = initial_balance
    end
    attr_accessor :account_id, :initial_balance
end