#! /usr/bin/env ruby
##****************************************************************************
# RUBY - Obscur Trader
#****************************************************************************
#   Ruby's Program - obscur_trader
#   Written by: Guillaume CHRISTE
# 	Date: 17-Jan-
#   
#   Description:
# 		- From an HTML Page we recover the name of the Cryptomoney Symbol & it's price
# 		- Each item is stored in a dedicated array then merged (zip) in a hash
# 		 
# 	Gems:
		require 'rubygems'
		require 'rubocop'
		require 'nokogiri'
		require 'open-uri'
#
#****************************************************************************
def obscur_trader
  begin
    url = "https://coinmarketcap.com/all/views/all/"
    html = Nokogiri::HTML(open(url))

    tblSymbol =[]
    tblPrice =[]

    html.css('td.text-left.col-symbol').map {|symbol| tblSymbol << symbol.text}
    html.css('.price').map {|price| tblPrice << (price.text)[1..-1]} #To remove the $ symbole

    hash = tblSymbol.zip(tblPrice)

  rescue StandardError => e
  	puts "The url #{url} is not valid and/or structure of the table has changed"
  end
end
# End of obscur_trader .......................................................
#.............................................................................
#.............................................................................
def perform
  puts obscur_trader.inspect
end

perform