class BankAccount

attr_accessor :name, :account_number, :deposit, :amount_deposited, :amount_withdrawn

	def initialize (name, account_number, deposit)
		@name = name
		@account_number = account_number
		@deposit = deposit
	end

#fix
	def account_balance
		if @amount_deposited == nil && @amount_withdrawn == nil && @current_balance == nil
			@deposit
		elsif @amount_deposited != nil && @amount_withdrawn == nil
		 	 @deposit += @amount_deposited
		elsif @amount_deposited == nil && @amount_withdrawn != nil
		 	 @deposit -= @amount_withdrawn
		else
			@deposit += (@amount_deposited - @amount_withdrawn)
		end 
	end
		
	def deposit
		puts "How much would you like to deposit?"
		@amount_deposited = gets.chomp.to_i
	end

	def withdrawal
		puts "How much would you like to withdraw?"
		@amount_withdrawn = gets.chomp.to_i
	end

	def status
		puts "----Account Status----"
		puts "Account Name: " + @name
		puts "Account Number: #" + @account_number.to_s
		puts "Balance: $" + self.account_balance.to_s
		puts "----------------------"
	end

end

my_account = BankAccount.new("Jen's Bank Account", 3334, 500)

my_account.status
my_account.deposit
my_account.withdrawal
my_account.status
my_account.withdrawal
my_account.status