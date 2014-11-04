require 'spec_helper'

describe Row do

    let(:row) {Row.new}

    it 'initializes with 50 seats' do 
        expect(row.seats.count).to eq 50
    end

    it 'can change the booking status of its seats' do 
        expect(row.seats[0]).to receive(:book!)
        row.book_seat!(0)
    end 

    it 'knows when a booking would leave a gap' do 
        row.book_seat!(2)
        expect {row.book_seat!(0)}.to raise_error(RuntimeError, "Sorry you cannot book if it will leave a gap of 1!")
        expect {row.book_seat!(4)}.to raise_error(RuntimeError, "Sorry you cannot book if it will leave a gap of 1!")
    end
end
