class Seat

    def initialize
        @booked = false
    end

    def booked?
        @booked
    end

    def book!
        if @booked
            raise "This seat is already booked!"
        else
            @booked = true
        end
    end
end
