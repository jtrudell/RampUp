require 'minitest/autorun'
require 'minitest/spec'

$:.unshift File.expand_path(File.dirname(__FILE__) + '/..')

require 'lib/bank_module'

describe Bank::BankAccount do
	subject {Bank::BankAccount.new("Jen", 123, 100, "p")}

		it "should be a bank account instance" do
			subject.must_be_instance_of Bank::BankAccount
		end

		it "should have a name" do
			subject.must_respond_to "name"
		end

		it "should initialize with a name, number, deposit and password" do
			bankaccount = Bank::BankAccount.new("Bob", 234, 400, "a")
			bankaccount.name.must_equal("Bob")
		end

		it "should respond to the account_balance method" do
		 	bankaccount = Bank::BankAccount.new("Bob", 234, 400, "a")
			bankaccount.must_respond_to "account_balance"
		end
end