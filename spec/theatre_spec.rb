require 'spec_helper'

describe Theatre do

    context 'theatre basics' do 

        it 'has 100 rows' do 
            theatre = Theatre.new
            expect(theatre.rows.count).to eq 100
        end

       xit 'each row has 50 seats' do 
            theatre = Theatre.new
            expect(theatre.rows.all? {|row| row.seats.count == 50}). to_be true
        end

    end

end
