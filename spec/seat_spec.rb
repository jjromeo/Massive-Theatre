require 'spec_helper'

describe Seat do
    it 'is empty' do
        seat = Seat.new
        expect(seat.empty?).to eq true
    end
end
