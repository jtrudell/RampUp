keys = ["name", "gender", "skin", "hair", "eye"] 
values = [ 
	[ "rachel", "girl", "black", "auburn", "brown"], 
	[ "mac", "boy", "white", "black", "brown"],
	[ "nick", "boy", "white", "brown", "blue"],
	[ "angie", "girl", "white", "auburn", "green"], 
	[ "theo", "boy", "white", "blonde", "brown"],
	[ "joshua", "boy", "white", "black", "brown"],
	[ "emily", "girl", "white", "blonde", "blue"],
	[ "jason", "boy", "white", "blonde", "green"],
	[ "john", "boy", "white", "brown", "blue"],
	[ "grace", "girl", "black", "black", "brown"],
	[ "jake", "boy", "white", "brown", "brown"],
	[ "megan", "girl", "white", "blonde", "green"],
	[ "ryan", "boy", "white", "auburn", "brown"],
	[ "brandon", "boy", "white", "blonde", "brown"],
	[ "beth", "girl", "white", "blonde", "brown"],
	[ "diane", "girl", "black", "brown", "brown"],
	[ "chris", "boy", "white", "black", "green"],
	[ "david", "boy", "black", "black", "brown"],
	[ "michelle", "girl", "black", "brown", "brown"],
	[ "tyson", "boy", "black", "black", "brown"],
	[ "ursula", "girl", "white", "auburn", "green"]
		]

suspects = Hash[*keys.zip(values).flatten]
puts suspects