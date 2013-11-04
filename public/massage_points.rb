require 'csv'
require 'pp'

parsed_file = CSV.read('./points.txt', {:col_sep => "\t" })


#puts "function drawLocations() {"
#puts "    layer.removeFeatures(layer.features);"
#puts "    var features = [];"
#puts "    var point;"

CSV.open('./p2.txt', 'wb', {:col_sep => "\t"}) do |csv|
  csv << ['lon', 'lat', 'title', 'description', 'icon']
  parsed_file.each do |row|
    point = row[0].split(' ')
    csv << [point[1], point[0], row[1], row[2], row[3]]
  end
end

#parsed_file.each do |row|
  #point = row[0].split(' ')
  #puts "point = new OpenLayers.LonLat(#{point[1]}, #{point[0]});"

  #puts "features.push(
        #new OpenLayers.Feature.Vector(
          #new OpenLayers.Geometry.Point(lonLat.lon, lonLat.lat)
      #)
      #);"
#end

#puts "layer.addFeatures(features);}"

#CSV.open('./fixed_points.txt', "wb", {:col_sep => "\t" }) do |csv|

  #parsed_file.each do |row|
    #point = row[0].split(' ')

    #formated = "#{point[1]},#{point[0]}"
    #csv << [formated, row[1], row[2], row[3]]
  #end
#end

#CSV.foreach('./points.txt') do |row|
#point, title, type, icon = row
#puts point
#end
