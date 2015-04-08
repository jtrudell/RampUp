class BankAccount

  def initialize(name, pin, starting_balance)
	@name = name
	@pin = 2345
	@starting_balance = starting_balance
  end

  def account_balance
	@current_balance = @starting_balance.to_i + @deposit.to_i - @withdraw.to_i
  end

  def current_balance=(account)
	account.current_balance = account_balance
  end

  def account_name
	@name
  end

  def account_pin
	@pin
  end

  def account_withdraw
	puts "How much do you want to withdraw?"
    @withdraw = gets.chomp.to_i
    @current_balance = @current_balance.to_i - @withdraw.to_i
    update_balance
  end

  def account_deposit
	puts "How much do you want to deposit?"
	@deposit = gets.chomp.to_i
	@current_balance = @current_balance.to_i + @deposit.to_i
	update_balance
  end

  def update_balance
	puts "Your new account balance is $#{@current_balance}"
  end

end

test_account = BankAccount.new("Test Account", @pin, 500)




def account_login(account)
puts "Please enter your pin:"
entered_pin = gets.chomp.to_i

  if entered_pin == account.account_pin
	puts "Your account name is #{account.account_name} and your account balance is $#{account.account_balance}"
	account_transactions(account)
  else 
	puts "You entered the wrong pin. Try again? Enter Yes or No."
	answer = gets.chomp.downcase
	if answer == "yes"
	account_login(account)
else puts "Have a nice day!"
end
  end
end

def account_transactions(account)
puts "Would you like to deposit or withdraw money from your account? Please enter deposit, withdraw, or end."
	decision = gets.chomp.downcase
	  if decision == "deposit"
		account.account_deposit
	  elsif decision == "withdraw"
	  account.account_withdraw
	  else puts "Have a nice day!"
	end
end
account_login(test_account)


