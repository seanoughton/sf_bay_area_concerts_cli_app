#!/usr/bin/env ruby

#this will be the cli controller

require scraper.rb #will do this here for now, but will move this to the environment file

Scraper.new.page_retrieval #creates a new Scraper instance and calls the page_retrieval method on it

