# Final Project for Rampup Ruby class @ Startup Institute 
# Jen Trudell May 11, 2015

require './bank_module'
require 'yaml'
require 'formatador'

def prompt
	print ">> "
end

def dollar_sign_divider
	puts Formatador.display_line("\t[green]$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$[/]")
end

# method to open a new account and write BankAccount object to customer's yaml file
def open_account
include Bank
	puts "Please re-enter your first name: "
	prompt
	customer_name = gets.chomp
	puts "Enter the amount of the opening deposit for your new account: "
	prompt
	opening_balance = gets.chomp.to_f
	puts "Choose a password for your account: "
	prompt
	customer_password = gets.chomp
	account_number = rand(1..1000)
	puts "Congratulations! You have opened an account at First Bank of Ruby."
	puts "Your account number is #{account_number}."
	new_customer = BankAccount.new(customer_name, account_number, opening_balance, customer_password)
	# write the new_customer object to the customer's yaml file
	new_customer.update_record(customer_name)
end

# method to load BankAccount object from customer's yaml file
def load_account
include Bank
	puts "Please enter your first name to access your account."
	prompt
	customer_name = gets.chomp
	customer_file = "#{customer_name}" + ".yaml"
	# if file with the customer's name exists, loads the BankAccount object from the file
	if File.exists?(customer_file)
		File.open(customer_file, 'r') do |file|
	  	YAML::load(file.read)
	  end
	# if customer doesn't exist, calls open_account to create a file/account for the customer, and then calls load_account
	else
		puts "It doesn't look like you have an account at First Bank of Ruby."
		puts "Let's open a new account for you."
		puts ""
		open_account
		load_account
	end 
end

dollar_sign_divider
puts Formatador.display_line("\t[blue]WELCOME TO THE FIRST BANK OF RUBY![/]")
dollar_sign_divider

# calls welcome method on BankAccount object that was loaded
load_account.welcome
