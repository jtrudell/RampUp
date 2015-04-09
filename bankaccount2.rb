class BankAccount

  def initialize(name, number, pin, balance)
	@name = name
	@number = number
	@pin = pin
	@balance = balance
  end

  def name
	@name
  end

  def account
	@account
  end

  attr_accessor :pin, :balance

  def balance
	@balance
  end

  def new_balance
  	@new_balance
  end

  def new_pin
  	@new_pin
  end

  def login
  	puts "Enter your pin: "
  	input = gets.chomp.to_i
  	if input == @pin
  		puts "Thanks. Your account name is #{@name}, your account number is #{@number} and your current account balance is $#{@balance}."
  		account_transaction
  	else puts "Wrong pin. Please type yes if you would like to try again, or no if you would like to quit."
  		input2 = gets.chomp
  		if input2 == "no"
  			puts "Have a nice day!"
  		else 
  			login
  		end
  	end
  end

  def account_transaction
  	puts "Would you like to make a deposit, make a withdrawal, check your balance, change your pin or quit?"
  	puts "Please enter deposit, withdrawal, balance, pin or quit: "
  	input = gets.chomp
  	if input == "deposit"
  		account_deposit
  	elsif input == "withdrawal"
  		account_withdrawal
  	elsif input == "balance"
  		account_balance
  	elsif input == "pin"
  		change_pin
  	else puts "Have a nice day!"
  	end
  end
  
  def account_deposit
  	puts "How much would you like to deposit?"
  	input = gets.chomp.to_i
  	@new_balance = input + @balance
  	update_balance
  	puts "Your account balance is $#{@balance}"
  	account_transaction
  end

  def account_withdrawal
  	puts "How much would you like to withdraw?"
  	input = gets.chomp.to_i
  	@new_balance = @balance - input
  	update_balance
  	puts "Your new account balance is $#{@balance}"
  	account_transaction
  end

  def account_balance
 	puts "Your current account balance is $#{@balance}."
 	account_transaction
 end

 def update_balance
 	@balance = @new_balance
 end

def update_pin
 	@pin = @new_pin
 end

  def change_pin
  	puts "What would you like your new pin to be?"
  	input = gets.chomp.to_i
  	@new_pin = input
  	update_pin
  	puts "Your pin has been change to #{@pin}"
  	account_transaction
  end
  		
end

test_account = BankAccount.new("Test Account", 555, @pin, @balance)
test_account.pin = 123
test_account.balance = 750

another_account = BankAccount.new("Jen's account", 1234, 555, 10000)
another_account.login





