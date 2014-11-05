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
    end
end

@booked_seats = []
    theatre.rows.each do |row|
    booked =  row.seats.select {|seat| seat.booked?}
    booked.each { |booked_seat| @booked_seats << booked_seat}
end

@free_seats = []
    theatre.rows.each do |row|
    booked =  row.seats.reject {|seat| seat.booked?}
    booked.each { |booked_seat| @free_seats << booked_seat}
end
puts "#{@booked_seats.count} seats have been booked. There are #{@free_seats.count} unbooked seats remaining"

