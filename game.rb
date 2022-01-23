require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    
def initialize (n,hash)
   @player = []
i=0
while i < hash.length
    @player << Human_player.new(hash.keys[i]) if hash.values[i] == false
    @player << ComputerPlayer.new(hash.keys[i]) if hash.values[i] == true

i+=1
end
@currectplayer = @player[0]
@board = Board.new(n)

@length = hash.length
end


def switch_turn
    @player.rotate!
        @currectplayer = @player[0]
    

end

def play
     if @board.empty_positions? == false
        @board.print
        p "Shoma mosavi shodid"
        return
     end
    @board.print
   a = @currectplayer.get_position(@board.legal_positions)
    @board.place_mark(a,@currectplayer.mark)
    if @board.win?(@currectplayer.mark)
        @board.print
        
        puts @currectplayer.mark
        puts "shoma barande shodid"
        return
    else
        switch_turn
        play
    end


end
print "player one MARK : "
puts

a = gets.chomp("\n")
print "player thow MARK : "
puts

b= gets.chomp("\n")

print "board size : "
puts
c= gets.chomp("\n")

d = Game.new(c.to_i,{a => false , b =>  false})

d.play
e = gets.chomp("\n")
end