class Theatre
    attr_reader :rows, :seats
    def initialize
        @rows = []
        100.times {@rows << Row.new}
    end

    def make_booking(booking_request)
        booking_request.gsub!(/[()]/, "")
        arr = booking_request.split(",")
        first_row_and_seat = rows[arr[1]].split(":")
        last_row_and_seat = rows[arr[2]].split(":")
        if first_row_and_seat[0] == last_row_and_seat[0]
           booking_range = (first_row_and_seat[1].to_i..last_row_and_seat[1].to_i)
           booking_range.each {|seat| first_row_and_seat[0].book_seat!(seat)} 
        else
            raise "Bookings must stay on the same row!"
        end
    end
end

