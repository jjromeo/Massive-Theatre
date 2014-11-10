class Theatre
    attr_reader :rows  
    def initialize
        @rows = []
        100.times {@rows << Row.new}
    end

    def make_booking(booking_request)
        format_booking(booking_request)
        check_and_book
    end

    private
    def format_booking(booking_request)
        booking_request.gsub!(/[()]/, "")
        @arr = booking_request.split(",")
        @first_row_and_seat = @arr[1].split(":")
        @last_row_and_seat = @arr[2].split(":")
    end

    def check_and_book
        quantity_check
        first_row, last_row = @first_row_and_seat[0], @last_row_and_seat[0]
        if first_row  == last_row
            book_seats(first_row, @first_row_and_seat[1], @last_row_and_seat[1])
        else
            raise "Bookings must stay on the same row!"
        end
    end

    def book_seats(row, first_seat, last_seat)
           @booking_range = (first_seat.to_i..last_seat.to_i)
           @booking_range.map {|seat| rows[row.to_i].book_seat(seat)} 
    end

    def quantity_check
        if @last_row_and_seat[1].to_i -  @first_row_and_seat[1].to_i >= 5
            raise "Sorry, 5 is the maximum number of bookings"
        end
    end

    def same_seat?
        @first_row_and_seat[1] == @last_row_and_seat[1]
    end

end

