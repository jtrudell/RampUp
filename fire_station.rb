# In-class exercise with HTTParty gem 
# May 4 2015 jtrudell@gmail.com

# requires ruby gem httparty
require 'httparty'

# creates class FireStation, initialize with response that httparty gem gets from city of new york firestation list on website
class FireStation

	attr_accessor :response

	def initialize
		@response = HTTParty.get("https://data.cityofnewyork.us/resource/hc8x-tcnd.json")
		
		# below are some other options we used in class, can ignore these
			#@response = HTTParty.get("https://data.cityofnewyork.us/resource/hc8x-tcnd.json?borough=manhattan&facilityname=Engine%2067")
			#puts response.body
			#puts "ruby: #{JSON.parse(response.body)}"
	end

# result of Jason.parse is an array full of hashes with info on fire stations. This method loops through the hashes,
# and prints out info on them only if they are located in Manhattan.
	def station_info
		array = JSON.parse(response.body)
		array.each do |station_info| 
			if station_info["borough"] == "Manhattan"
				puts "Facility Name:"
				puts station_info["facilityname"]
				puts "Facility Address:"
				puts station_info["facilityaddress"]
				puts "Borough:"
				puts station_info["borough"]
				puts "-------------------"
			end
		end
	end

end

# creates new fire station
fire_station = FireStation.new

# calls station_info method on it
fire_station.station_info

