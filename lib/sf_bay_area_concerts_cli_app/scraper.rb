class Scraper

	#going to require these here for now, but they will need to be moved to another file .. an environment.rb file ?
	require 'nokogiri'
	require 'open-uri'

		#create a method that uses Nokogiri  and open uri to return the page as a Nokogiri array - http://apeconcerts.com

	def page_retrieval #this method returns the nokogiri array of the page
		Nokogiri::HTML(open("http://apeconcerts.com"))
	end


	def get_all_concerts
		self.page_retrieval.css("div#ape-event .content-information")
	end
	#this is being called by an instance of the Scrape class
	#create a method that gets all of the concerts from the page
	#each concert has a class of ape-event, mix detail-information
 

	#create a method that scrapes each individual concert
	#needs to have a url for each specific concert

	#create a method that scrapes a specific concert based on a specific concert url



end