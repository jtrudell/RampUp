# Returns first and last name, and a middle name of any length (but only if user enters a middle name).
# Jen Trudell March 23. 2015


# Creates method full_name, which accepts first_name and last_name arguments, and sets middle_name to 0 as default.
# If middle_name remains 0, returns first_name and last_name. If middle_name is assigned a different value (i.e.,
# if user enters a middle name) returns first_name, middle_name and last_name.

def full_name (first_name, last_name, middle_name = 0)

	if middle_name == 0
		puts "#{first_name} " + "#{last_name}"
	else puts "#{first_name} " + "#{middle_name} " + "#{last_name}"
	end

end

# prompts user for full name. keeps prompting until user
# enters at least two names (i.e. a first and last name.)
name = "blank"
until name.include?(" ") == true
puts "What is your full name?"
name = gets.chomp
end


# converts name string into an array, and assigns first_name
# to first object in array and last_name to last object in array.
name_array = name.split(" ")
first_name = name_array.first
last_name = name_array.last

# if name_array only contains two objects (i.e., if user only entered a first and last name)
# calls method full_name with just first_name and last_name arguments
if name_array.size == 2
full_name(first_name, last_name)

# else, deletes  first_name and last_name from the array (i.e., first and last objects in the array)
# leaving only the middle name (which can be any length) in the array.
# Array is then converted (using .join) into the string middle_name, and full_name method is called with
# all three name arguments. 
else 
	name_array.delete(first_name)
	name_array.delete(last_name)
	middle_name = name_array.join(" ")
	full_name(first_name, last_name, middle_name)
end
