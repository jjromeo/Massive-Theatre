require 'spec_helper'

describe BookingHandler do

    it 'can read the contents of a file' do 
        booker = BookingHandler.new
        booker.parse_bookings('./booking_requests.txt')
        expect(booker.parsed_bookings.count).to eq 500
    end
end
