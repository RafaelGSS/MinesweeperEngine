require 'Field'

class Board
    attr_accessor :width, :height, :mines, :matrix

    def initialize(height, width, mines)
        @height = height
        @width  = width
        @mines  = mines
        
        init_board()
        init_mines()
    end

    # for capture around, need x-1 and y+1
    # recursive mode for open all fields emptys
    def open_empty(x, y)
       for x_ in x-1..x+1
            for y_ in y-1..y+1
                if(field_valid(x_,y_) && !@matrix[x_][y_].is_checked? && !@matrix[x_][y_].is_flag?)
                    @matrix[x_][y_].checked = true
                    @remaining_plays -= 1
                    if(@matrix[x_][y_].is_empty?)
                        open_empty(x_, y_)
                    end
                end
            end
        end
    end

    # for capture around, need height-1 and width-1
    def init_board()
        @matrix = []

        for x in 0..@height-1
            for y in 0..@width-1
                @matrix[x][y] = Field.new(0)
            end
        end
    end

    def init_mines()
        for min in 1..@mines
            while true
                x = rand(0..(height-1))
                y = rand(0..(height-1))

                if !@matrix[x][y].is_bomb?
                    @matrix[x][y].value = '#'
                    check_mines_next(x,y)
                    break
                end
            end
        end
    end

    def [](x,y)
        return @matrix[x][y]
    end
    
    def field_valid(x, y)
       return x >= 0 && y >= 0 && x < @height  && y < @width
    end

    def check_mines_next(x, y)
        for x_ in x-1..x+1
            for y_ in y-1..y+1
                if(field_valid(x_, y_)  && !@matrix[x_][y_].is_bomb?)
                    @matrix[x_][y_].value += 1
                end
            end
        end 
    end
end
