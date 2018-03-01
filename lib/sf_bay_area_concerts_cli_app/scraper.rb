class Scraper

	#going to require these here for now, but they will need to be moved to another file .. an environment.rb file ?
	require 'nokogiri'
	require 'open-uri'

	def page_retrieval #this method gets the nokogiri array of the page
		doc Nokogiri::HTML(open("http://apeconcerts.com"))
		puts doc
	end

	#create a method that uses Nokogiri  and open uri to return the page as a Nokogiri array - http://apeconcerts.com
	#going to need to require nokogir and open uri somewhere

	#create a method that gets all of the concerts from the page
	#each concert has a class of ape-event, mix detail-information
 

	#create a method that scrapes each individual concert
	#needs to have a url for each specific concert

	#create a method that scrapes a specific concert based on a specific concert url



end