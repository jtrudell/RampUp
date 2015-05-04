# Write a program that prints the numbers from 1 to 100. 
# But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. 
# For numbers which are multiples of both three and five print “FizzBuzz”."
# May 3, 2015 jtrudell@gmail.com

for i in 1..100
	if i % 3 == 0 && i % 5 == 0
		puts "FizzBuzz"
	elsif i % 3 == 0
		puts "Fizz"
	elsif i % 5 == 0
		puts "Buzz"
	else
		puts i
	end
end

# Why is this supposed to be hard?