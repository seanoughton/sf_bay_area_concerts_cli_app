class SfBayAreaConcertsCliApp::Scraper

	#this returns the nokogiri array of the page
	def page_retrieval 
		Nokogiri::HTML(open("http://apeconcerts.com"))
	end

	#this scrapes the page and returns just the concert information for each concert
	def scrape_all_concerts
		self.page_retrieval.css("div#ape-event .content-information")
	end

	#this scrapes the main concerts page for each concert for specific attributes: url, artist_name, location, date, ticket availability
	def scrape_concert_attributes
		concerts = self.scrape_all_concerts #gets all concerts nokogiri objects
		#for each specific concert grab these attributes
		concerts.each do |concert|
			url = concert.css(".entry a")[0]['href']
			artist_name = concert.css(".entry .show-title").text
			location = concert.css(".entry .venue-location-name").text
			date_showtime = concert.css(".date-show")[0]['content']
			soldout = concert.css(".event-data .button.ghost.soldout").text

			#some of the concerts are sold out
			if soldout != "Sold Out!"
				available = "Tickets Available"
			else
				available = "Sold Out!"
			end

			#talks to Concert class, tells it to create a new concert for each of the concerts on the page
			SfBayAreaConcertsCliApp::Concert.new_concert_from_index_element(url,artist_name,location,date_showtime,available)
		end

	end


	#this scrapes the url of a specific concert 
	def self.scrape_specific_concert(url)
		doc = Nokogiri::HTML(open("#{url}"))	

		ticket_price = doc.css(".more-information p").text.match(/\$\d\d\.+\d+/)

		#the if statements below check to see if the item returned from a scrape is a nokorgiri object
		#this is to prevent getting errors from returning nil from scraping
		
		if (doc.css(".bio p")).inspect != "[]"
			bio = doc.css(".bio p")[0..-1].text
		end


		if (doc.css(".more-information.social-icons #website")).inspect != "[]"		
			artist_website = doc.css(".more-information.social-icons #website")[0]['href']
		end

	
		if (doc.css(".more-information.social-icons #music")).inspect != "[]"
			where_to_find_music = doc.css(".more-information.social-icons #music")[0]['href']
		end
	

		if (doc.css(".more-information.social-icons #facebook")).inspect != "[]"
			facebook = doc.css(".more-information.social-icons #facebook")[0]['href']
		end


		if (doc.css(".more-information.social-icons #twitter")).inspect != "[]"
			twitter = doc.css(".more-information.social-icons #twitter")[0]['href']
		end


		if (doc.css(".more-information.social-icons #instagram")).inspect != "[]"
			instagram = doc.css(".more-information.social-icons #instagram")[0]['href']
		end


		if (doc.css(".more-information.social-icons #youtube")).inspect != "[]"
			youtube = doc.css(".more-information.social-icons #youtube")[0]['href']
		end

		#if (doc.css(".event-data a")).inspect != "[]"
			buy_tickets_link = doc.css(".event-data a")[0]['href']
		#end
		

		concert_attributes = [ticket_price,bio,artist_website,where_to_find_music,facebook,twitter,instagram,youtube,buy_tickets_link]

	end


end