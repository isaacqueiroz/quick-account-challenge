require "account"
RSpec.describe Account do
    subject(:valid_account) { described_class.new(123,13052) }
    let(:negative_account_transactions) { [ {
        account_id: 123,
        value: -150000
    } ] }
    let(:positive_account_transactions) { [ {
        account_id: 123,
        value: 350000
    } ] }
    let(:mixed_account_transactions) { [ {
        account_id: 123,
        value: -150000
    }, {
        account_id: 123,
        value: 120000
    } ] }

    describe "create a valid account" do
        it "should have a valid account id" do
            expect(valid_account.account_id).to eq(123)
        end

        it "should have a converted float balance" do
            expect(valid_account.initial_balance).to eq(13052)
        end
    end

    describe "should add transactions to the account given a list" do
        it "add account transactions" do
            expect(valid_account.add_transactions(mixed_account_transactions).length).to be(2)
        end        
    end

    describe "it should provide a valid balance" do
        it "for a positive transaction" do
            expect(valid_account.add_transactions(positive_account_transactions).length).to be(1)
            expect(valid_account.balance).to be(363052)
        end
        it "for a negative transaction" do
            expect(valid_account.add_transactions(negative_account_transactions).length).to be(1)
            expect(valid_account.balance).to be(-137248)
        end
        it "for a mixed transaction (penalty charge only for withdraw)" do
            expect(valid_account.add_transactions(mixed_account_transactions).length).to be(2)
            expect(valid_account.balance).to be(-17248)
        end
    end
end