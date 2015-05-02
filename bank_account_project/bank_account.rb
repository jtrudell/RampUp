class BankAccount

attr_accessor :name, :account_number, :balance

	def initialize (name, account_number, balance)
		@name = name
		@account_number = account_number
		@balance = balance
	end

	def account_balance(deposit, withdrawal)
		adjustment_to_balance = deposit - withdrawal
		@balance = @balance + adjustment_to_balance
	end
		
	def deposit
		puts "How much would you like to deposit?"
		amount_deposited = gets.chomp.to_i
		self.account_balance(amount_deposited, withdrawal=0)
	end

	def withdrawal
		puts "How much would you like to withdraw?"
		amount_withdrawn = gets.chomp.to_i
		self.account_balance(deposit = 0, amount_withdrawn)
	end

	def status
		puts "----Account Status----"
		puts "Account Name: " + @name
		puts "Account Number: #" + @account_number.to_s
		puts "Balance: $" + @balance.to_s
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
my_account.withdrawal
my_account.deposit
my_account.status
