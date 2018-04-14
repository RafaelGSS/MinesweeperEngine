require_relative 'Field'
require_relative 'Minesweeper'

class Board
    attr_accessor :width, :height, :mines, :matrix

    def initialize(height, width, mines)
        @height = height
        @width  = width
        @mines  = mines
        
        init_board()
        init_mines()
    end

    def open_empty(x, y, decrease_plays=false)
       for x_ in x-1..x+1
        next if x_ < 0 || x_ >= @height
            for y_ in y-1..y+1
                next if y_ < 0 || y_ >= @width
                if(field_valid(x_,y_) && !@matrix[x_][y_].is_checked? && !@matrix[x_][y_].is_flag?)
                    @matrix[x_][y_].checked = true
                    Minesweeper.remaining_plays -= 1 if decrease_plays
                    if(@matrix[x_][y_].is_empty?)
                        open_empty(x_, y_, decrease_plays)
                    end
                end
            end
        end
    end
  
    def init_board()
        @matrix = []

        for x in 0..@height-1
            vector = []
            for y in 0..@width-1
               vector.push(Field.new(0))
            end
            @matrix.push(vector)
        end
    end

    def init_mines()
        for min in 1..@mines
            while true
                x = rand(0..(@height-1))
                y = rand(0..(@width-1))

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
