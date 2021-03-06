class BookingHandler 
    attr_reader :parsed_bookings, :theatre, :rejected_bookings, :booked_seats, :available_seats
    
    def initialize
        @parsed_bookings = [] 
        @theatre = Theatre.new
        @rejected_bookings = []
        @available_places = []
        @booked_places = []
    end

    def process_bookings(file)
        parse_bookings(file)
        book_requests
    end

    def parse_bookings(file)
        File.open(file, "r").each_line {|line| @parsed_bookings << "#{line.slice(0..-4)}"}.close
    end

    def book_requests
        parsed_bookings.each_with_index do |request, index|
            begin
                theatre.make_booking(request)
            rescue RuntimeError => error
                rejected_bookings << "Booking number #{index}: #{error.message}" 
            end
        end
    end

    def booked_seats
        theatre.rows.each do |row|
            return_booked_seats(row)
        end
            @booked_places
    end
    
    def return_booked_seats(row)
            row.seats.select {|seat| seat.booked?}.each {|booked_seat| @booked_places << booked_seat}
    end

    def return_available_seats(row)
            row.seats.reject {|seat| seat.booked?}.each {|available_seat| @available_places << available_seat}
    end


    def available_seats
        theatre.rows.each do |row|
            return_available_seats(row)
        end
            @available_places
    end
end
