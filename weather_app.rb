
require 'yahoo_weatherman'
puts "Please enter your location by city"
city = gets
def get_location(city)
	client = Weatherman::Client.new
	client.lookup_by_location(city)
end

weather = get_location(city)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|

	day = forecast['date']
	weekday = day.strftime('%w').to_i

	if weekday == today
		dayName = "Today"
	elsif  today == today + 1
		dayName = "Tommorrow"
	else 
		dayName = day.strftime('%A')
	end

	lowC = forecast['low']
	lowF = (lowC * 9)/5 + 32
	
	highC = forecast['high']
	highF = (highC * 9)/5 + 32	
	
	puts dayName + ' will be ' + forecast['text'].downcase + ' with a high of ' +
	highF.to_s + ' and a low of ' + lowF.to_s + '.'

end



=begin
puts "Enter your zipcode: "
zip = gets 
weather = client.lookup_by_location(zip)

puts weather.location['city']
puts weather.condition['temp']
puts weather.wind['direction']



weather.forecasts.each do |forecast|
	puts forecast['day'].to_s + ' will be ' + forecast['text'].downcase + ' with a high of ' +
	forecast['high'].to_s + ' and a low of ' + forecast['low'].to_s '.'
end


puts weather.description()
=end




