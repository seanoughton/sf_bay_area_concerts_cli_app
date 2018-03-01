class Concert

	attr_accessor :url, :artist_name, :location, :date_showtime, :available, :ticket_price, :bio, :artist_website, :where_to_find_music, :facebook, :twitter, :instagram, :youtube


	@@all = []


	def self.new_concert_from_index_element(url,artist_name,location,date_showtime,available)
		self.new(url,artist_name,location,date_showtime,available)
	end

	def initialize (url,artist_name,location,date_showtime,available)
		@url = url
		@artist_name = artist_name
		@location = location
		@date_showtime = date_showtime
		@available = available
		@@all << self
	end

	def self.all
		@@all
	end
##
	def add_additional_attributes
		doc = Scraper.scrape_specific_concert(self.url)
		self.bio = doc.css(".bio p")[0..-1].text
		self.artist_website = doc.css(".more-information.social-icons #website")[0]['href']
		self.where_to_find_music = doc.css(".more-information.social-icons #music")[0]['href']
		self.facebook = doc.css(".more-information.social-icons #facebook")[0]['href']
		self.twitter = doc.css(".more-information.social-icons #twitter")[0]['href']
		self.instagram = doc.css(".more-information.social-icons #instagram")[0]['href']
		self.youtube = doc.css(".more-information.social-icons #youtube")[0]['href']
		end
	end


end