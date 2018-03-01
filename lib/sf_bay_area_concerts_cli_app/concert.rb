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


end