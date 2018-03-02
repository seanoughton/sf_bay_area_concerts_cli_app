class SfBayAreaConcertsCliApp::Concert

	#creates all of the readers/writers for the attributes
	attr_accessor :url, :artist_name, :location, :date_showtime, :available, :ticket_price, :bio, :artist_website, :where_to_find_music, :facebook, :twitter, :instagram, :youtube

	#array for all concert instances
	@@all = []

	#creates the concert instances with the scraped data from the ist of all concerts
	def self.new_concert_from_index_element(url,artist_name,location,date_showtime,available)
		self.new(url,artist_name,location,date_showtime,available)
	end

	#creates the attributes upon object instantiation
	def initialize (url,artist_name,location,date_showtime,available)
		@url = url
		@artist_name = artist_name
		@location = location
		@date_showtime = date_showtime
		@available = available
		@@all << self
	end

	#makes the @@all array accessible as a class method
	def self.all
		@@all
	end

	#checks to see if the item returned from a scrape is a nokorgiri object
	#this is here to prevent getting errors from returning nil from scraping
	def check_for_nokogiri_object?(selector)
		true if selector.inspect != "[]"
	end

	#adds the specific attributes for each concert once the user has selected that concert
	def add_additional_attributes

		#scrapes the url of the specific concert
		doc = SfBayAreaConcertsCliApp::Scraper.scrape_specific_concert(self.url)

		#assigns ticket price
		self.ticket_price = doc.css(".more-information p").text.match(/\$\d\d\.+\d+/)

		#assigns bio (if there is one)
		if check_for_nokogiri_object?(doc.css(".bio p"))
			self.bio = doc.css(".bio p")[0..-1].text
		end

		#assigns artist website (if there is one)
		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #website"))
			self.artist_website = doc.css(".more-information.social-icons #website")[0]['href']
		end
		
		#assigns where to find/buy artists music
		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #music"))
			self.where_to_find_music = doc.css(".more-information.social-icons #music")[0]['href']
		end

		#assigns facebook link (if there is one)
		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #facebook"))
			self.facebook = doc.css(".more-information.social-icons #facebook")[0]['href']
		end

		#assigns twitter link (if there is one)
		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #twitter"))
			self.twitter = doc.css(".more-information.social-icons #twitter")[0]['href']
		end

		#assigns instagram link (if there is one)
		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #instagram"))
			self.instagram = doc.css(".more-information.social-icons #instagram")[0]['href']
		end

		#assigns youtube link (if there is one)
		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #youtube"))
			self.youtube = doc.css(".more-information.social-icons #youtube")[0]['href']
		end
		
	end


end