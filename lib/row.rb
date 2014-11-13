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
        two_behind, behind, two_in_front, in_front = seats[seat_number - 2], seats[seat_number - 1], seats[seat_number + 2], seats[seat_number + 1]
        if two_behind && two_in_front 
            check_both(seat_number)
        elsif two_behind 
            check_gap(two_behind, behind)
        elsif two_in_front 
            check_gap(two_in_front, in_front)
        end
    end
    
    def check_gap_two_behind(seat_number)
        if seats[seat_number - 2].booked? && !(seats[seat_number - 1].booked?)
            gap_warning
        end
    end

    def check_gap(seat_two_away, seat_one_away)
        if seat_two_away.booked? && !(seat_one_away.booked?)
            gap_warning
        end
    end

    def check_both(seat_number)
            check_gap_two_behind(seat_number)
            check_gap_two_in_front(seat_number)
    end


    def check_gap_two_in_front(seat_number)
        if seats[seat_number + 2].booked? && !(seats[seat_number + 1].booked?)
            gap_warning
        end
    end
    
    def gap_warning
        raise "Sorry you cannot book if it will leave a gap of 1!"
    end


end
