require 'spec_helper'

describe BookingHandler do

    let(:booker) {BookingHandler.new}

    it 'can read the contents of a file' do 
        booker.parse_bookings('./booking_requests.txt')
        expect(booker.parsed_bookings.count).to eq 500
    end

    it 'can book places based on the contents of the file it takes in' do 
        booker.parse_bookings('./booking_requests.txt')
        expect(booker.theatre).to receive(:make_booking).exactly(500).times
        booker.book_requests
    end

    context 'when bookings have been taken and made' do 

        before do 
            booker.parse_bookings('./booking_requests.txt')
            booker.book_requests
        end

        it 'knows how many bookings have been rejected' do 
            expect(booker.rejected_bookings.count).to eq(11)
        end

        it 'knows why each booking has been rejected and which one' do 
            expect(booker.rejected_bookings.first).to eq "Booking number 32: Sorry, 5 is the maximum number of bookings"
        end

    end
end
