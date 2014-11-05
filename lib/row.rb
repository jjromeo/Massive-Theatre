class Row
    attr_reader :seats
    def initialize
       @seats = []
       50.times { @seats << Seat.new}
    end 

    def book_seat!(seat_number)
        check_for_gaps(seat_number)
        seats[seat_number].book!
    end

    private
    def check_for_gaps(seat_number)
        if seats[seat_number - 2] && seats[seat_number + 2] 
            if seats[seat_number - 2].booked? && !(seats[seat_number - 1].booked?)
                raise "Sorry you cannot book if it will leave a gap of 1!"
            elsif seats[seat_number + 2].booked? && !(seats[seat_number + 1].booked?)
                raise "Sorry you cannot book if it will leave a gap of 1!"
            end
        elsif seats[seat_number - 2]
            if seats[seat_number - 2].booked? && !(seats[seat_number - 1].booked?)
                raise "Sorry you cannot book if it will leave a gap of 1!"
            end
        elsif seats[seat_number + 2]
            if seats[seat_number + 2].booked? && !(seats[seat_number + 1].booked?)
                raise "Sorry you cannot book if it will leave a gap of 1!"
            end
        end
            
    end
end
