class BookingHandler 
    attr_reader :parsed_bookings, :theatre, :rejected_bookings, :booked_seats, :available_seats
    
    def initialize
       @parsed_bookings = [] 
       @theatre = Theatre.new
       @rejected_bookings = []
    end

    def process_bookings(file)
        parse_bookings(file)
        book_requests
    end

    def parse_bookings(file)
        f = File.open(file, "r")
        f.each_line {|line| @parsed_bookings << "#{line.slice(0..-4)}"}
        f.close
    end

    def book_requests
        parsed_bookings.each_with_index do |request, index|
            begin
                theatre.make_booking(request)
            rescue RuntimeError => e
                rejected_bookings << "Booking number #{index}: #{e.message}" 
            end
        end
    end

    def booked_seats
        @booked_places = []
        theatre.rows.each do |row|
            booked =  row.seats.select {|seat| seat.booked?}
            booked.each { |booked_seat| @booked_places << booked_seat}
        end
            @booked_places
    end
    
    def available_seats
        @available_places = []
        theatre.rows.each do |row|
            available = row.seats.reject {|seat| seat.booked?}
            available.each { |available_seat| @available_places << available_seat}
        end
            @available_places
    end
end
