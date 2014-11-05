require './lib/seat'
require './lib/row'
require './lib/theatre'

theatre = Theatre.new
@requests = []
f = File.open("./booking_requests.txt", "r")
f.each_line {|line| @requests << "#{line.slice(0..-4)}"}
f.close

@requests.each_with_index do |request, index|
    begin
        theatre.make_booking(request)
    rescue RuntimeError => e
        puts "booking number #{index}:  #{e.message}"
    rescue NoMethodError
    end
end
