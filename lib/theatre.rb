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
        if @first_row_and_seat[0] == @last_row_and_seat[0]
           booking_range = (@first_row_and_seat[1].to_i..@last_row_and_seat[1].to_i)
           booking_range.map {|seat| rows[@first_row_and_seat[0].to_i].book_seat!(seat)} 
        else
            raise "Bookings must stay on the same row!"
        end
    end
end

