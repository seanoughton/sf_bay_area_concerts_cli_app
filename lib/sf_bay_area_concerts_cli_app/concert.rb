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

	def check_for_nokogiri_object?(selector)
		true if selector.inspect != "[]"
	end
##
	def add_additional_attributes
		doc = Scraper.scrape_specific_concert(self.url)

		self.ticket_price = doc.css(".more-information p").text.match(/\$\d\d\.+\d+/)

		if check_for_nokogiri_object?(doc.css(".bio p"))
			self.bio = doc.css(".bio p")[0..-1].text
		end


		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #website"))
			self.artist_website = doc.css(".more-information.social-icons #website")[0]['href']
		end
		

		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #music"))
			self.where_to_find_music = doc.css(".more-information.social-icons #music")[0]['href']
		end

		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #facebook"))
			self.facebook = doc.css(".more-information.social-icons #facebook")[0]['href']
		end

		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #twitter"))
			self.twitter = doc.css(".more-information.social-icons #twitter")[0]['href']
		end

		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #instagram"))
			self.instagram = doc.css(".more-information.social-icons #instagram")[0]['href']
		end
		if check_for_nokogiri_object?(doc.css(".more-information.social-icons #youtube"))
			self.youtube = doc.css(".more-information.social-icons #youtube")[0]['href']
		end
		
	end


end