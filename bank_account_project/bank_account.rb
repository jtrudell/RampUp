
module Bank
# create class BankAccount, which includes Customer module. BankAccount includes account name, number and balance.
class BankAccount


attr_accessor :name, :account_number, :balance, :password

	def initialize (name, account_number, balance, password)
		@name = name
		@account_number = account_number
		@balance = balance
		@password = password
	end

# transaction_time method sets time of a transaction and formats it to M/D/Y and 12 hour time
	def transaction_time
		time = Time.now
		time.strftime("%m/%d/%Y at %I:%M%p")
	end

# account_balance method provides current account balance
	def account_balance(deposit, withdrawal)
		adjustment_to_balance = deposit - withdrawal
		@balance = @balance + adjustment_to_balance
	end

# deposit method handles deposits to accounts
	def deposit
		puts "How much would you like to deposit?"
		amount_deposited = gets.chomp.to_f
		self.account_balance(amount_deposited, withdrawal=0)
		puts "You deposited $#{amount_deposited.to_s} on #{transaction_time}"
	end

# withdrawal method handles withdrawls from accounts
	def withdrawal
		puts "How much would you like to withdraw?"
		amount_withdrawn = gets.chomp.to_f
		self.account_balance(deposit = 0, amount_withdrawn)
		puts "You withdrew $#{amount_withdrawn.to_s} on #{transaction_time}"
	end

# status method prints out account name, account number, and balance
	def status
		puts "----Account Status as of #{transaction_time}----"
		puts "Account Name: " + @name
		puts "Account Number: #" + @account_number.to_s
		puts "Balance: $" + @balance.to_s
		puts "----------------------"
	end

# atm method allows customer to call transactions method
	def atm(selection)
		if selection == "1"
			status
			transactions
		elsif selection == "2"
			deposit
			transactions
		elsif selection == "3"
			withdrawal
			transactions
		else 
			customer_file = "#{@name}" + ".yaml"
				File.open(customer_file, 'w') do |file|  
  			file.puts YAML::dump(self)
  			end
		end			
	end

# transactions methods allows customer to check account status or make depsoits/withdrawals
# after they have entered their password. They have 3 tries to enter right pass word.
	def transactions
		password_attempts = 2
		puts "Enter your password: "
		answer = gets.chomp
		if check_password(answer) == true
			puts "What would you like to do today? "
			puts "\tEnter 1 to see account balance "
			puts "\tEnter 2 to make a deposit "
			puts "\tEnter 3 to make a withdrawal "
			puts "\tEnter Q to quit "
			print "Selection: "
			selection = gets.chomp
			atm(selection)
		else
			until password_attempts == 0
				puts "Re-enter your password. You have #{password_attempts} more tries. "
				answer = gets.chomp
				check_password(answer)
				password_attempts -=1
			end
			puts "You have no more password attempts. Please try again later."
		end
		customer_file = "#{@name}" + ".yaml"
		File.open(customer_file, 'w') do |file|  
  			file.puts YAML::dump(self)
  		end
	end

# check_password methods confirms the customer has entered the correct pass word
	def check_password(entered_password)
		if entered_password == @password
			true
		else 
			puts "You entered the wrong password."
		end
	end
end
end

# method to open a new account and write it to customers.txt
def open_account
include Bank
require 'yaml'
	puts "What is the customer's name?"
	customer_name = gets.chomp
	puts "What is the new account number?"
	account_number = gets.chomp.to_i
	puts "What is the opening balance of the account?"
	opening_balance = gets.chomp.to_f
	puts "Enter a password for the customer."
	customer_password = gets.chomp
	new_customer = BankAccount.new(customer_name, account_number, opening_balance, customer_password)
	#write the new_customer object to the customers file
	customer_file = "#{customer_name}" + ".yaml"
	File.open(customer_file, 'w') do |file|  
  		file.puts YAML::dump(new_customer)
	end  
end



# method to load account from customer yaml file
def load_account
include Bank
require 'yaml'
	puts "What customer's account would you like to load?"
	customer_name = gets.chomp
	customer_file = "#{customer_name}" + ".yaml"

	
	File.open(customer_file, 'r') do |file|
  	YAML::load(file.read)
  	
	end 
end


#open_account
test_account = load_account
test_account.transactions

#my_account = BankAccount.new("Jen's Bank Account", 3334, 500, "password")

#my_account.transactions

