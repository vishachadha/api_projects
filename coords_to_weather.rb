require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp
street_address = "#{the_latitude},#{the_longitude}"
#puts "test: printing street address, #{street_address}"
url_safe_street_address = URI.encode(street_address)

url_of_data_we_want = "https://api.forecast.io/forecast/f3fd7a235149bf9d4eb20dead0b3a9eb/#{url_safe_street_address}"

raw_data = open(url_of_data_we_want).read
#puts "test: printing raw_data #{raw_data}"
parsed_data = JSON.parse(raw_data)

the_temperature = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["minutely"]["summary"]
the_day_outlook = parsed_data["hourly"]["summary"]
the_week_outlook = parsed_data["daily"]["summary"]
# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
puts "The outlook for the next week is: #{the_week_outlook}"

