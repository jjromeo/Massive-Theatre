require 'spec_helper'

describe Seat do
    it 'is empty' do
        seat = Seat.new
        expect(seat).not_to be_booked
    end

    it 'can be booked' do 
        seat = Seat.new
        seat.book!
        expect(seat).to be_booked
    end
end
