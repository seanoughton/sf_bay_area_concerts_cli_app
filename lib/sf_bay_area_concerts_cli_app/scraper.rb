class Scraper

	def page_retrieval #this method returns the nokogiri array of the page
		Nokogiri::HTML(open("http://apeconcerts.com"))
	end


	def scrape_all_concerts
		self.page_retrieval.css("div#ape-event .content-information")
	end

	def scrape_concert_attributes
		concerts = self.scrape_all_concerts #gets all concerts nokogiri objects
		#for each specific concert grab these attributes
		concerts.each do |concert|
			url = concert.css(".entry a")[0]['href']
			artist_name = concert.css(".entry .show-title").text
			location = concert.css(".entry .venue-location-name").text
			date_showtime = concert.css(".date-show")[0]['content']
			soldout = concert.css(".event-data .button.ghost.soldout").text
			available = "Tickets Available" if soldout != "Sold Out!" else available = "Sold Out!"
			#talks to Concert class, tells it to create a new concert for each of the concerts on the page
			Concert.new_concert_from_index_element(url,artist_name,location,date_showtime,available)
		end
	end


 
	def self.scrape_specific_concert(url)
		doc = Nokogiri::HTML(open("#{url}"))	
	end



end