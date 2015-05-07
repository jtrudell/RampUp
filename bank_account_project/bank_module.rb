module Bank
require 'yaml'
require 'formatador'
# create class BankAccount. BankAccount object initilized with customer name, account number, balance and password.
class BankAccount


attr_accessor :name, :account_number, :balance, :password

	def initialize (name, account_number, balance, password)
		@name = name
		@account_number = account_number
		@balance = balance
		@password = password
	end

	def prompt
		print ">> "
	end

# transaction_time method sets time of a transaction and formats it to M/D/Y and 12 hour clock
	def transaction_time
		time = Time.now
		time.strftime("%m/%d/%Y at %I:%M%p")
	end

# account_balance method provides current account balance
	def account_balance(deposit, withdrawal)
		adjustment_to_balance = deposit - withdrawal
		@balance += adjustment_to_balance
	end

# deposit method handles deposits to accounts
	def deposit
		puts "\nHow much would you like to deposit?"
		prompt
		amount_deposited = gets.chomp.to_f
		self.account_balance(amount_deposited, withdrawal=0)
		puts Formatador.display_line("[green]You deposited $#{amount_deposited.to_s} on #{transaction_time}[/]\n") 
	end

# withdrawal method handles withdrawls from accounts
	def withdrawal
		puts "\nHow much would you like to withdraw?"
		prompt
		amount_withdrawn = gets.chomp.to_f
		self.account_balance(deposit = 0, amount_withdrawn)
		puts Formatador.display_line("[green]You withdrew $#{amount_withdrawn.to_s} on #{transaction_time}[/]\n") 
	end

# status method prints out account name, account number, and balance
	def status
		puts ""
		puts Formatador.display_line("[green]----Account Status as of #{transaction_time}----[/]")
		puts "\tAccount Name: " + @name +"'s Account"
		puts "\tAccount Number: #" + @account_number.to_s
		puts "\tBalance: $" + @balance.to_s
		puts ""
		puts Formatador.display_line("[green]------------------------------------------------[/]")
	end

# atm method allows customer to call transactions method
	def atm(selection)
		# 1 is account status
		if selection == "1"
			status
			transactions
		# 2 is deposit	
		elsif selection == "2"
			deposit
			transactions
		# 3 is withdrawal
		elsif selection == "3"
			withdrawal
			transactions
		# 4 else writes updated info on customer (i.e., change in balance due to deposits/withdrawals) to customer's yaml file
		else 
			customer_file = "#{@name}" + ".yaml"
				File.open(customer_file, 'w') do |file|  
  			file.puts YAML::dump(self)
  			end
		end			
	end

# transactions methods allows customer to check account status or make depsoits/withdrawals
# Must enter password each time you want to make a transaction. Customer has 3 tries to enter correct password.
	def transactions
		password_attempts = 2
		puts "Please enter your password: "
		prompt
		answer = gets.chomp
		# calls check_password method. If check_password true (i.e. entered correct password), lists transaction options.
		if check_password(answer) == true
			puts "What would you like to do today? "
			puts Formatador.display("[green]Enter 1[/] to see account balance")
			puts Formatador.display("[green]Enter 2[/] to make a deposit")
			puts Formatador.display("[green]Enter 3[/] to make a withdrawal")
			puts Formatador.display("[green]Enter Q[/] to quit")
			print "Selection: "
			selection = gets.chomp
			# calls atm method bassed on what number they have selected
			atm(selection)
		else
			until password_attempts == 0
				puts "Re-enter your password. You have #{password_attempts} more tries."
				prompt
				answer = gets.chomp
				check_password(answer)
				password_attempts -=1
			end
			puts "You have no more password attempts. Please try again later."
		end
		# writes updated info on customer (i.e., change in balance due to deposits/withdrawals) to customer's yaml file
		customer_file = "#{@name}" + ".yaml"
		File.open(customer_file, 'w') do |file|  
  			file.puts YAML::dump(self)
  		end
	end

# check_password methods confirms the customer has entered the correct password
	def check_password(entered_password)
		if entered_password == @password
			true
		else 
			puts "You entered the wrong password."
		end
	end
end
end