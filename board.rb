class Board 

    def initialize(n)
        grid = Array.new(n,){Array.new(n,"_")}
        @grid = grid
        @board_height = n
    end
    
    def grid
        @gird = grid

    end

    def valid?(pos)
        print "hello"
         row = pos[0]
         col = pos[1]
         if ( (row >= 0 && row <=@board_height - 1) && (col >= 0 && col <=@board_height - 1) )
            true
         else
            false
         end
            
    end

    def empty?(pos)
        if @grid[pos[0]][pos[1]] == "_"
            true
        else
            false 
        end
    end

    def place_mark(pos,mark)

        raise "position is invalid"  if valid?(pos) == false
        raise "position is full"  if empty?(pos) == false    
        @grid [pos[0]][pos[1]] = mark
        

    end

    def print
i=0
while i < @board_height
          p @grid[i]  
          puts
          i+=1
end
        
    end

    def win_row?(mark)
        @grid.each do |row|
            temp = row[0]
        return true if (row.all?{|ele| ele == temp } ) && temp == mark
        end
            false
        end

        def win_col?(mark)
            i=0
            u=[]
            while i < @grid.length
                @grid.each do |row|
                    u <<  row[i]
                end
                temp = u[0]
                return true if u.all?{|ele| ele==temp } && u.all?{|ele| ele == mark}
                i+=1
                u=[]
            end
            false
        end

        def win_diagonal?(mark)
            i=0
            u=[]
            while i < @grid.length
                u << @grid[i][i]
                i+=1

            end
            temp = @grid[0][0] 
            return true if u.all?{|ele| ele == temp} && temp == mark
            
            j=0
            k=[]
            b=@grid.length - 1
            while j < @grid.length
                k << @grid[j][b-j]
                j+=1

            end
            temp_2 = @grid[1][1] 
            return true if k.all?{|ele| ele == temp_2} && temp_2 == mark
            false
        end

        def win?(mark)

            return true if win_row?(mark) || win_diagonal?(mark) || win_col?(mark)
            false
        end 

        def empty_positions?
            a = @grid.flatten
            return true if a.include?("_")
            false
        end

        def legal_positions
            u=[]
            i=0
            j=0
            while i < @board_height
                while j < @board_height
                        u << [i,j] if empty?([i,j])
                    j+=1
                end
                j=0
                i+=1
            end
            u
        end
end