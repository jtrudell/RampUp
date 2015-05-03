#create Module customer, which includes class Person. Person includes name and address.
module Customer

	class Person

		attr_accessor :name, :address

		def initialize(name, address)
			@name = name
			@address = address
		end

	end

end

#create class BankAccount, which includes Customer module. BankAccount includes account name, number and balance.
class BankAccount

include Customer

attr_accessor :name, :account_number, :balance

	def initialize (name, account_number, balance)
		@name = name
		@account_number = account_number
		@balance = balance
	end

#account_balance method provides current account balance
	def account_balance(deposit, withdrawal)
		adjustment_to_balance = deposit - withdrawal
		@balance = @balance + adjustment_to_balance
	end

#deposit method handles deposits to accounts
	def deposit
		puts "How much would you like to deposit?"
		amount_deposited = gets.chomp.to_i
		self.account_balance(amount_deposited, withdrawal=0)
	end

#withdrawal method handles withdrawls from accounts
	def withdrawal
		puts "How much would you like to withdraw?"
		amount_withdrawn = gets.chomp.to_i
		self.account_balance(deposit = 0, amount_withdrawn)
	end

#status method prints out account name, account number, and balance
	def status
		puts "----Account Status----"
		puts "Account Name: " + @name
		puts "Account Number: #" + @account_number.to_s
		puts "Balance: $" + @balance.to_s
		puts "----------------------"
	end
end

#method to open a new account and write it to customers.txt
def open_account
include Customer
require 'yaml'
	puts "What is the customer's name?"
	customer_name = gets.chomp
	puts "What is the customer's address?"
	customer_address = gets.chomp
	new_customer = Person.new(customer_name, customer_address)
	#write the new_customer object to the customers.txt file, converted to YAML format
	File.open('customers.txt', 'a+') do |f|  
  		f.write(new_customer.to_yaml)
	end  
end


#method to bring up an account from customers.txt
def load_account
include Customer
require 'yaml'
	puts "What customer's account would you like to load?"
	customer_name = gets.chomp
	File.open('customers.txt', 'a+') do |f|
	puts f.gets YAML::load(customer_name)
	end
end

open_account
load_account
#my_account = BankAccount.new("Jen's Bank Account", 3334, 500)

#my_account.status
#my_account.deposit
#my_account.withdrawal
#my_account.status
#my_account.withdrawal
#my_account.status
#my_account.withdrawal
#my_account.deposit
#my_account.status
