require 'spec_helper'

describe Row do

    it 'initializes with 50 seats' do 
        row = Row.new
        expect(row.seats.count).to eq 50
    end

    it 'can change the booking status of it\'s seats' do 
        row = Row.new
        row.book_seat!(1)
        expect(row.seats[0]).to receive(:book!)
    end 

end
