require 'spec_helper'

describe Seat do
    let(:seat){Seat.new}
    it 'is empty' do
        expect(seat).not_to be_booked
    end

    it 'can be booked' do 
        seat.book!
        expect(seat).to be_booked
    end

    it 'can\'t be booked if it\'s already booked' do
        seat.book!
        expect(seat).to be_booked
        expect{seat.book!}.to raise_error(RuntimeError, "This seat is already booked!")
    end
end
