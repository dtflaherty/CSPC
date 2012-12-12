#! /usr/bin/env ruby
# vim: set noet nosta sw=4 ts=4 :
#
# Calendar of State Papers mapper
# Wayne Graham <wayne.graham@virginia.edu
#

require 'geocoder'

LOCATIONS = %w{
  Jamaica
  Falmouth, Jamaica
  Charlestown
}

output = "point\ttitle\tdescription\ticon"

LOCATIONS.each do |location|
  result = Geocoder.search(location).first
  lat = result.latitude
  lon = result.longitude

  output << "\n#{lon}, #{lat}\t#{result.address}\t"
end

File.open('points.txt', 'w'){ |file| file.write(output) }
