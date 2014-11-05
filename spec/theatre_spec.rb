require 'spec_helper'

describe Theatre do

    let(:theatre) {Theatre.new}

    context 'theatre basics' do 

        it 'has 100 rows' do 
            expect(theatre.rows.count).to eq 100
        end

       it 'each row has 50 seats' do 
            expect(theatre.rows.all? {|row| row.seats.count == 50}).to eq true
        end

    end

    context 'taking bookings' do 
        it 'can accept a group booking' do 
            theatre.rows[67].seats[44..47].each { |seat| expect(seat).to receive(:book!)}
            theatre.make_booking("(1,67:44,67:47)")       
        end

        it 'will not accept a booking that is not all on the same row' do 
            expect {theatre.make_booking("(194,44:48,45:49)")}.to raise_error "Bookings must stay on the same row!"
        end

        it 'will not accept a booking that is for more than 5 people' do
            expect {theatre.make_booking("(10,30:5,30:10)")}.to raise_error "Sorry, 5 is the maximum number of bookings"
        end

        it 'will accept a booking that is for only 1 place' do 
            expect(theatre.rows[90].seats[49]).to receive(:book!)
            theatre.make_booking("(391,90:49,90:49)")
        end
    end

end
