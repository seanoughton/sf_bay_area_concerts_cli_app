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


	


	#adds the specific attributes for each concert once the user has selected that concert
	def add_additional_attributes

		#scrapes the url of the specific concert
		attribute_array = SfBayAreaConcertsCliApp::Scraper.scrape_specific_concert(self.url)
	
		self.ticket_price = attribute_array[0]
		self.bio = attribute_array[1]
		self.artist_website = attribute_array[2]
		self.where_to_find_music = attribute_array[3]
		self.facebook = attribute_array[4]
		self.twitter = attribute_array[5]
		self.instagram = attribute_array[6]
		self.youtube = attribute_array[7]
		
	end


end