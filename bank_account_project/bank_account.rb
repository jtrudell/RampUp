
require './bank_module'
require 'yaml'

def prompt
	print ">> "
end

# method to open a new account and write it to customer's yaml file
def open_account
include Bank
	puts "What is the customer's name?"
	prompt
	customer_name = gets.chomp
	puts "What is the new account number?"
	prompt
	account_number = gets.chomp.to_i
	puts "What is the opening balance of the account?"
	prompt
	opening_balance = gets.chomp.to_f
	puts "Enter a password for the customer."
	prompt
	customer_password = gets.chomp
	new_customer = BankAccount.new(customer_name, account_number, opening_balance, customer_password)
	# write the new_customer object to the customer's yaml file
	customer_file = "#{customer_name}" + ".yaml"
	File.open(customer_file, 'w') do |file|  
  		file.puts YAML::dump(new_customer)
	end  
end



# method to load account from customer's yaml file
def load_account
include Bank
	puts "What customer's account would you like to load?"
	prompt
	customer_name = gets.chomp
	customer_file = "#{customer_name}" + ".yaml"
	File.open(customer_file, 'r') do |file|
  	YAML::load(file.read)
	end 
end


#open_account
test_account = load_account
test_account.transactions

