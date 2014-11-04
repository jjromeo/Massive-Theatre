class Row
    attr_reader :seats
    def initialize
       @seats = []
       50.times { @seats << Seat.new}
    end 

    def book_seat!(seat_number)

    end
end
