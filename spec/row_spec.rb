require 'spec_helper'

describe Row do

    it 'initializes with 50 seats' do 
        row = Row.new
        expect(row.seats.count).to eq 50
    end
end
