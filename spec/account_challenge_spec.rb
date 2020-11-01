require "account_challenge"
RSpec.describe AccountChallenge do
    describe "process the input" do
        #Before conversion, we have a big string-ish file
        let(:account_input) {
            "123,13052\n456,23012"
        }
        let(:transaction_input) {
            "123,350000\n123,-150000\n456,15000"
        }
        #Basically, after conversion, we'll have an array of hashes
        let(:accounts) { [ {
            account_id: 123,
            initial_balance: 13052
        }, {
            account_id: 456,
            initial_balance: 23012
        } ] }

        let(:transactions) { [ {
            account_id: 123,
            value: 350000
        }, {
            account_id: 123,
            value: -150000
        }, {
            account_id: 456,
            value: 15000
        } ] }
        context "when the input is valid" do
            it "read the account input file" do
                expect(AccountChallenge.read_account_input(account_input)).not_to be_nil
            end

            it "has a valid number of accounts" do
                expect(AccountChallenge.read_account_input(account_input).select{|account| account['account_id'] == 123}).not_to be_nil
            end

            it "read the transaction file" do
                expect(AccountChallenge.read_transaction_input(transaction_input)).not_to be_nil
            end

            it "has a valid number of transactions" do
                expect(AccountChallenge.read_transaction_input(account_input).select{|account| account['account_id'] == 123}).not_to be_nil
            end
        end
    end     
end