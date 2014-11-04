require 'spec_helper'

describe Theatre do

    context 'theatre basics' do 

        it 'has 100 rows' do 
            theatre = Theatre.new
            expect(theatre.rows.count).to eq 100
        end

    end

end
