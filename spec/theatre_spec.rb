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
            expect(theatre.rows[67].seats[44..48]).to receive(:book!)
            theatre.make_booking("(1,67:44,67:47)")       
        end
    end

end
