require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
street_address = gets.chomp

url_safe_street_address = URI.encode(street_address)
url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)
the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

#puts "test: printing lat and long #{the_latitude} #{the_longitude}"

#load 'address_to_coords.rb'

street_address_2 = "#{the_latitude},#{the_longitude}"
# puts "test: printing street address, #{street_address}"
url_safe_street_address = URI.encode(street_address_2)

url_of_data_we_want = "https://api.forecast.io/forecast/f3fd7a235149bf9d4eb20dead0b3a9eb/#{url_safe_street_address}"

raw_data = open(url_of_data_we_want).read
#puts "test: printing raw_data #{raw_data}"
parsed_data = JSON.parse(raw_data)

the_temperature = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["minutely"]["summary"]
the_day_outlook = parsed_data["hourly"]["summary"]
the_week_outlook = parsed_data["daily"]["summary"]

#Your code goes below.

#Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{street_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
puts "The outlook for the next week is: #{the_week_outlook}"

