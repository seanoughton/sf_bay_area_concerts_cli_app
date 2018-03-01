class Scraper

	def page_retrieval #this method returns the nokogiri array of the page
		Nokogiri::HTML(open("http://apeconcerts.com"))
	end


	def scrape_all_concerts
		self.page_retrieval.css("div#ape-event .content-information")
	end


	def create_concert
		entries = self.scrape_all_concerts.css(".entry")
		entries.each do |entry|
			url = entry.css("a")[0]['href']
			artist_name = entry.css(".show-title").text
			location = entry.css(".venue-location-name").text
			date_showtime = "This is a stub for the date"
			Concert.new_concert_from_index_element(url,artist_name,location,date_showtime)
		end
	end
 

	#create a method that scrapes each individual concert
	#needs to have a url for each specific concert

	#create a method that scrapes a specific concert based on a specific concert url



end