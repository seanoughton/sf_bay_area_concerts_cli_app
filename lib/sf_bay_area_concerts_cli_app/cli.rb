class SfBayAreaConcertsCliApp::CLI

	def start

		puts "Here are the concerts in the Bay Area by Ape Concerts:"
		SfBayAreaConcertsCliApp::Scraper.new.scrape_concert_attributes 
		display_all_concerts


		puts "Which concert would you like more information about?"
		input = 0
		while input == 0
		  puts "Please enter a number."
		  input = gets.strip.to_i
		end

		concert = SfBayAreaConcertsCliApp::Concert.all[input-1]
		concert.add_additional_attributes
		display_individual_concert_info(concert)

	end

	def display_all_concerts
		SfBayAreaConcertsCliApp::Concert.all.each.with_index(1) do |concert,index|
			puts "#{index}.  #{concert.artist_name} is playing at #{concert.location} on #{concert.date_showtime}. #{concert.available.upcase}"
		end
	end

	def check_y_or_n(input)
		while (input != "y") && (input != "n")
			puts "Please enter (y/n)"
			input = gets.strip.downcase
		end
		input
	end

	def display_individual_concert_info(concert)
		puts ""
		puts "----------------------------------------------------------------------------------------------------"
		puts "#{concert.artist_name} will be at #{concert.location} on #{concert.date_showtime}"
		puts "Tickets are available for #{concert.ticket_price}"
		if concert.available == "Sold Out!"
			puts "Tickets are Sold Out!"
		else
			puts "Tickets are available starting at #{concert.ticket_price}"
		end

		puts "----------------------------------------------------------------------------------------------------"
		puts "Here is some more information about this artist:"
		puts "You can find out more about this artist here: #{concert.artist_website}" if concert.artist_website
		puts "You can find this artist's music here: #{concert.where_to_find_music}" if concert.where_to_find_music
		puts "You can watch music videos here: #{concert.youtube}" if concert.youtube
		puts "Here are #{concert.artist_name}'s social links:"
		puts "facebook : #{concert.facebook}" if concert.facebook
		puts "twitter: #{concert.twitter}" if concert.twitter 
		puts "instagram: #{concert.instagram}" if concert.instagram 
		puts "----------------------------------------------------------------------------------------------------"
		puts ""

		if concert.bio 
			puts "Do you want to read #{concert.artist_name}'s bio (y/n)?"
			input = gets.strip.downcase
			if check_y_or_n(input) == "y"
				puts ""
				puts "----------------------------------------------------------------------------------------------------"
				puts "#{concert.bio}"
				puts "----------------------------------------------------------------------------------------------------"
				puts ""
			end
		end

		puts "Would you like to see the list of concerts again (y/n)?"
		input = gets.strip.downcase
		

		if check_y_or_n(input)== "y"
			start
		else
			puts "Thanks.  Good-bye!"
		end
	end


end





