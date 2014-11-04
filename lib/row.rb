class Row
    attr_reader :seats
    def initialize
       @seats = []
       50.times { @seats << Seat.new}
    end 
end
