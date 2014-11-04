class Theatre
    attr_reader :rows, :seats
    def initialize
        @rows = []
        100.times {@rows << Row.new}
    end
end

