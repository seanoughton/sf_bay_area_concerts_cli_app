class SfBayAreaConcertsCliApp::CLI

	#starts the app and initiates user interaction
	def start

		puts "Here are the concerts in the Bay Area by Ape Concerts:"
		#creates an instance of the Scraper class and calls #scrape_concert_attributes method
		#this creates concert instances and stores them in a Class Array
		SfBayAreaConcertsCliApp::Scraper.new.scrape_concert_attributes 

		#displays all of the concerts
		display_all_concerts

		#user interaction - asks the user which concert they want to know about and gets input
		puts "Which concert would you like more information about?"
		input = 0
		while input == 0
		  puts "Please enter a number."
		  input = gets.strip.to_i
		end

		#this chooses the concert from the Class Array, scrapes the individual concert page, then adds those attributes to the individual concert
		concert = SfBayAreaConcertsCliApp::Concert.all[input-1]
		concert.add_additional_attributes

		#this displays the information about the individual concert
		display_individual_concert_info(concert)

	end

	#this displays the list of all concerts
	def display_all_concerts
		SfBayAreaConcertsCliApp::Concert.all.each.with_index(1) do |concert,index|
			puts "#{index}.  #{concert.artist_name} is playing at #{concert.location} on #{concert.date_showtime}. #{concert.available.upcase}"
		end
	end


	#a method for making the user enter a y or n, rather than something else
	def check_y_or_n(input)
		while (input != "y") && (input != "n")
			puts "Please enter (y/n)"
			input = gets.strip.downcase
		end
		input
	end

	#displays the concert and artist info for a specific concert
	def display_individual_concert_info(concert)
		puts ""
		puts "----------------------------------------------------------------------------------------------------"
		puts "#{concert.artist_name} will be at #{concert.location} on #{concert.date_showtime}"

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

		#asks the user if they want to read the artist bio
		#this is a separate action, because some of the bio's are really long and the user may not want to read them
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

		#asks the user if they would like to see the concert list again
		#if not exit the program
		puts "Would you like to see the list of concerts again (y/n)?"
		input = gets.strip.downcase
		

		if check_y_or_n(input)== "y"
			start
		else
			puts "Thanks.  Good-bye!"
		end
	end


end





