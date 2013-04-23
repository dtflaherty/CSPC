require 'csv'
require 'pp'

parsed_file = CSV.read('./points.txt', {:col_sep => "\t" })

CSV.open('./fixed_points.txt', "wb", {:col_sep => "\t" }) do |csv|

  parsed_file.each do |row|
    point = row[0].split(' ')

    formated = "#{point[1]},#{point[0]}"
    csv << [formated, row[1], row[2], row[3]]
  end
end

#CSV.foreach('./points.txt') do |row|
#point, title, type, icon = row
#puts point
#end
