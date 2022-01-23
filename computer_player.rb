

class ComputerPlayer

    def initialize(mark)
        @mark = mark
    end
    
    def mark
        @mark
    end
    def get_position(positions)
       
       b = positions.sample
       puts "Computer " 
       puts @mark
       puts  "Chose "
        p b
        b
    end





end