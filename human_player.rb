

class Human_player

    def initialize(mark)
        @mark = mark
    end
    
    def mark
        @mark
    end

    def get_position(position)
        again = true
        a = *("0".."999")

        while again == true
            again = false
            p @mark 
            p " pls enter a postion " 

            input = gets.chomp
            check = input.split("")
            if a.include?(check[0]) == false ||  a.include?(check[2]) == false || check[1] != " " || check.length !=3
                 p " wrong format corect example `n m` n & m are pos nums " 
                 again = true
            end
            if position.include?([check[0].to_i,check[2].to_i]) == false 
                p "ilegal position "
                again = true

            end

        
            
        end
        return [check[0].to_i,check[2].to_i]

    end





end