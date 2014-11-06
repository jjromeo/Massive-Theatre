require './lib/seat.rb'
require './lib/row.rb'
require './lib/theatre.rb'
require './lib/booking_handler.rb'

booker = BookingHandler.new
puts "Welcome to the Theatre Booking Processor app"
puts "Please enter the file you would like to process bookings from"
booker.process_bookings(gets.chomp.to_s)
puts "====================================="
puts "Your bookings have been processed."
puts "====================================="
puts "The following bookings were rejected:"
booker.rejected_bookings.each {|booking_info| puts booking_info}
puts "====================================="
puts "#{booker.booked_seats.count} seats have been booked, leaving #{booker.available_seats.count} seats available"
