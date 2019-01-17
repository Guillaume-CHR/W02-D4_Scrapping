#! /usr/bin/env ruby
##****************************************************************************
# RUBY - Recovery of TownHall emails
#****************************************************************************
#   Ruby's Program - Email Recovery 
#   Written by: Guillaume CHRISTE
# 	Date: Date of modification
#   
#   Description:
# 		- From the website 'http://annuaire-des-mairies.com/val-d-oise.html' we access all cities
# 		- For each city, we recover its email address and store both name & email in an array
# 		
# 	Gems:
		require 'rubygems' 
		require 'rubocop'
		require 'nokogiri'
		require 'open-uri'
#
#****************************************************************************
def get_townhall_email(url) #From an url retrieves the email address 
  begin
    html = Nokogiri::HTML(open(url))

    email_town = html.css('section:nth-child(2) div table tbody tr:nth-child(4) > td:nth-child(2)').text

  rescue StandardError => e
  	puts "The web page #{url} is not valid and/or structure of the table has changed"
  end
end

def get_townhall_urls #From the url, retrieves the urls to each city hall 
  begin
    url = "http://annuaire-des-mairies.com/val-d-oise.html"
    html = Nokogiri::HTML(open(url))

    tblTown =[]
    tblEmail = []

    html.css('.lientxt').map do |link_to_town|
      tblTown << link_to_town.text
      tblEmail << get_townhall_email("http://annuaire-des-mairies.com#{(link_to_town['href'])[1..(link_to_town['href']).length]}")
    end

    hash = tblTown.zip(tblEmail)

  rescue StandardError => e
  	puts "The url #{url} is not valid and/or structure of the table has changed"
  end
end

# End of Email Recovery ......................................................
#.............................................................................
#.............................................................................
puts get_townhall_urls