class Row
    attr_reader :seats
    def initialize
       @seats = []
       50.times { @seats << Seat.new}
    end 

    def book_seat!(seat_number)
        seats[seat_number - 1].book!
    end
end
