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
	end



end