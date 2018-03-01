class CLI

	def start

		puts "Here are the concerts in the Bay Area by Ape Concerts:"
		Scraper.new.create_concert
		display_all_concerts


		puts "Which concert would you like more information about? Please enter a number."
		input = gets.strip.to_i-1

		concert = Concert.all[input]
		concert.add_additional_attributes

	end

	def display_all_concerts
		Concert.all.each.with_index(1) do |concert,index|
			puts "#{index}.  #{concert.artist_name} is playing at #{concert.location} on #{concert.date_showtime}. #{concert.available.upcase}"
		end
	end


end
