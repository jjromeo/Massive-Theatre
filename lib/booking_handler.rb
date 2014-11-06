class BookingHandler 
    attr_reader :parsed_bookings
    
    def initialize
       @parsed_bookings = [] 
    end

    

    def parse_bookings(file)
        f = File.open(file, "r")
        f.each_line {|line| @parsed_bookings << "#{line.slice(0..-4)}"}
        f.close
    end
end
