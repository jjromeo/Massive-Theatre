class Row
    attr_reader :seats
    def initialize
       @seats = []
       50.times { @seats << Seat.new}
    end 

    def book_seat(seat_number)
        check_for_gaps(seat_number)
        seats[seat_number].book
    end

    private
    def check_for_gaps(seat_number)
        behind, in_front = seats[seat_number - 2], seats[seat_number + 2]
        if behind && in_front 
            check_gap_behind(seat_number)
            check_gap_in_front(seat_number)
        elsif behind 
            check_gap_behind(seat_number)
        elsif in_front 
            check_gap_in_front(seat_number)
        end
    end
    
    def check_gap_behind(seat_number)
        if seats[seat_number - 2].booked? && !(seats[seat_number - 1].booked?)
            gap_warning
        end
    end

    def check_gap_in_front(seat_number)
        if seats[seat_number + 2].booked? && !(seats[seat_number + 1].booked?)
            gap_warning
        end
    end
    
    def gap_warning
        raise "Sorry you cannot book if it will leave a gap of 1!"
    end


end
