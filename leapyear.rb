puts "Enter starting year:"
start_year = gets.chomp.to_i

puts "Enter ending year:"
end_year = gets.chomp.to_i

years = Range.new(start_year, end_year)

years.each do |x|
	if x % 4 == 0 && x % 100 != 0 || x % 400 == 0
		puts x
	end
end