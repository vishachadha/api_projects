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

# Your code goes below.
url_of_data_we_want = "https://api.forecast.io/forecast/f3fd7a235149bf9d4eb20dead0b3a9eb/#{url_safe_street_address}"
#puts "test: printing url_data_we want- #{url_of_data_we_want}"

raw_data = open(url_of_data_we_want).read
#puts "test: printing raw_data #{raw_data}"
parsed_data = JSON.parse(raw_data)

the_temperature = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["hourly"]["summary"]
the_day_outlook = parsed_data["daily"]["summary"]
# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{street_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
