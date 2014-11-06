class BookingHandler 
    attr_reader :parsed_bookings, :theatre, :rejected_bookings
    
    def initialize
       @parsed_bookings = [] 
       @theatre = Theatre.new
       @rejected_bookings = []
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
end
