# create Bank module so BankAccount class can be pulled into bank_account.rb (for opening new accounts, transactions)
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

		# welcome greets customer, calls check_password method
		def welcome
	
			puts Formatador.display_line("\t[red]Welcome to the ATM at Bank of Ruby, #{@name}![/]")
			check_password
		end

		# check_password method confirms password before atm_transactions is called. Customer has 3 tries to enter correct password.
		def check_password
			password_attempts = 2
			puts "Please enter your password: "
			prompt
			answer = gets.chomp
			#If answer matches password, calls atm_transactions method and customer can proceed.
			if answer == @password
				atm_transactions
			else
				until password_attempts == 0
					puts "\nYou did not enter the correct password."
					puts "Please enter your password. You have #{password_attempts} password attempts left."
					prompt
					answer = gets.chomp
					if answer == @password
						atm_transactions
						exit
					end
					password_attempts -=1
				end
				puts "\nYou have no more password attempts. Please try again later."
			end
		end

		# atm_transactions method allows customer to call deposit, withdrawal, and status methods
		def atm_transactions
			puts "Please select from the below options: "
			puts ""
			puts Formatador.display("\t[red]Enter 1[/]: to see account balance")
			puts Formatador.display("\t[red]Enter 2[/]: to make a deposit")
			puts Formatador.display("\t[red]Enter 3[/]: to make a withdrawal")
			puts Formatador.display("\t[red]Enter Q[/]: to quit")
			puts ""
			print "Selection: "
			selection = gets.chomp
			# 1 is account status
			if selection == "1"
				status
				atm_transactions
			# 2 is deposit	
			elsif selection == "2"
				deposit
				atm_transactions
			# 3 is withdrawal
			elsif selection == "3"
				withdrawal
				atm_transactions
			# 4 else writes updated info on customer (i.e., change in balance due to deposits/withdrawals) to customer's yaml file and ATM closes
			else 
				update_record(@name)
				puts "Your session is over. Thanks for banking with us!"
				puts "Logged #{@name} out on #{transaction_time}"
				puts ""		
			end			
		end

		# update_record method updates (or creates, if it doesn't exist) customer's yaml file with BankAccount object of customer
		def update_record(name)
			customer_file = "#{name}" + ".yaml"
					File.open(customer_file, 'w') do |file|  
	  			file.puts YAML::dump(self)
	  			end
	  	end
	  			
		# account_balance method provides method to update balance after deposit/withdrawal
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
			puts ""
			puts Formatador.display_line("[blue]You deposited $#{amount_deposited.to_s} on #{transaction_time}[/]") 
		end

		# withdrawal method handles withdrawls from accounts
		def withdrawal
			puts "\nHow much would you like to withdraw?"
			prompt
			amount_withdrawn = gets.chomp.to_f
			self.account_balance(deposit = 0, amount_withdrawn)
			puts
			puts Formatador.display_line("[blue]You withdrew $#{amount_withdrawn.to_s} on #{transaction_time}[/]") 
		end

		# status method prints out account name, account number, and balance
		def status
			puts ""
			puts Formatador.display_line("[blue]----Account Balance as of #{transaction_time}----[/]")
			puts "\tAccount Name: " + @name +"'s Account"
			puts "\tAccount Number: #" + @account_number.to_s
			puts "\tBalance: $" + @balance.to_s
			puts ""
			puts Formatador.display_line("[blue]------------------------------------------------[/]")
		end
	
	end

end