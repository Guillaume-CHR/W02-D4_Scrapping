#! /usr/bin/env ruby
##****************************************************************************
# RUBY - Recovery of Member information (name, lastname & email)
#****************************************************************************
#   Ruby's Program - Email Recovery 
#   Written by: Guillaume CHRISTE
# 	Date: 17-Jan-2019
#   
#   Description:
# 		- Fetch name & first name of each member
# 		- Rebuilt the email address for pattern
# 		
# 	Gems:
		require 'rubygems' 
		require 'rubocop'
		require 'nokogiri'
		require 'open-uri'
#
#****************************************************************************
def get_member_info
  begin
    url = "https://www.nosdeputes.fr/deputes"
    html = Nokogiri::HTML(open(url))
    tbl = []
    html.css('.list_nom').map  do |fullname| 
      ifullname = fullname.text.gsub(/\s+/, "")
      _firstname = ifullname.split(',').first
      _lastname = ifullname.split(',').last
      _email = "#{_firstname.split(' ').first}.#{_lastname.tr(" ", "")}@assemblee-nationale.fr".downcase.tr("é", "e").tr("è", "e")
      tbl << {"lastname" => _lastname, "firstname" => _firstname, "email" => _email}
    end

  rescue StandardError => e
  	puts "The url #{url} is not valid and/or structure of the table has changed"
  end
end

# End of get_member_info .....................................................
#.............................................................................
#.............................................................................

def perform
  puts get_member_info
end

perform