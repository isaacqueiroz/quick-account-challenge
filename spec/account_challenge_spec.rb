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
            initial_balance: 130.52
        }, {
            account_id: 456,
            initial_balance: 230.12
        } ] }

        let(:transactions) { [ {
            account_id: 123,
            value: 3500.00
        }, {
            account_id: 123,
            value: -1500.00
        }, {
            account_id: 456,
            value: 150.00
        } ] }
        context "when the input is valid" do
            it "read the account input file" do
                expect(AccountChallenge.read_account_input(account_input)).not_to be_nil
            end

            it "has a valid number of accounts" do
                expect(AccountChallenge.read_account_input(account_input).find_by_account_id(123)).not_to be_nil
            end

            it "read the transaction file" do
                expect(AccountChallenge.read_transaction_input(transaction_input)).not_to be_nil
            end

            it "has a valid number of transactions" do
                expect(AccountChallenge.read_transaction_input(account_input).find_by_account_id(123)).not_to be_nil
            end
        end
        context "when the input is not valit" do
            it "will throw an error" do
                expect(AccountChallenge.read_account_input('This is not Valid')).to raise_error(Errors::InvalidInput)
            end
        end
    end     
end