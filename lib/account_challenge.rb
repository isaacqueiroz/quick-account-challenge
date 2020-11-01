require 'csv'
class AccountChallenge
#     irb(main):021:0> a = CSV.new(content, headers: ["id","b"], :header_converters => :symbol, :converters => :all)
# => <#CSV io_type:StringIO encoding:UTF-8 lineno:0 col_sep:"," row_sep:"\n" quote_char:"\"" headers:true>
# irb(main):022:0> a.to_a.map {|row| row.to_hash }
# => [{:id=>123, :b=>13052}, {:id=>456, :b=>23012}]
    def self.read_account_input(input)
        @accounts = CSV.new(input, headers: ["account_id","initial_balance"], :header_converters => :symbol, :converters => :all).to_a.map {|row| row.to_hash }
    end

    def self.read_transaction_input(input)
        @transactions = CSV.new(input, headers: ["account_id","value"], :header_converters => :symbol, :converters => :all).to_a.map {|row| row.to_hash }
    end

    def self.print_balances
        
    end
end