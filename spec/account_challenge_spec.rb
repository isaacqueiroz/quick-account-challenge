require "account_challenge"
require "byebug"
RSpec.describe AccountChallenge do
    describe "process the input" do
        #Before conversion, we have a big string-ish file
        let(:account_input) {
            "123,13052\n456,23012"
        }
        let(:transaction_input) {
            "123,350000\n123,-150000\n456,15000"
        }
        let(:account_challenge) { AccountChallenge.new }
        context "when the input is valid" do
            it "read the account input file" do
                expect(account_challenge.read_account_input(account_input)).not_to be_nil
            end

            it "has a valid number of accounts" do
                expect(account_challenge.read_account_input(account_input).select{|account| account['account_id'] == 123}).not_to be_nil
            end

            it "read the transaction file" do
                expect(account_challenge.read_transaction_input(transaction_input)).not_to be_nil
            end

            it "has a valid number of transactions" do
                expect(account_challenge.read_transaction_input(transaction_input).select{|account| account['account_id'] == 123}).not_to be_nil
            end
        end

        context "returns a valid output" do
            let(:challenge) do
                c = described_class.new
                c.read_account_input(account_input)
                c.read_transaction_input(transaction_input)
                return c
            end
            it "should print both accounts" do
                expect{ challenge.print_balances }.to output(/123/).to_stdout 
            end

            it "should print both balances" do
                expect{ challenge.print_balances }.to output(/213052/).to_stdout 
            end
        end
    end     
end