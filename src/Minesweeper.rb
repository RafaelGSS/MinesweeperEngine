require_relative 'Board'

class Minesweeper
    attr_accessor :still_playing,:flags, :board

    def initialize(width, height, mines)
        @board  = Board.new(height, width, mines)
        @still_playing = true
        @flags = 0
        @@remaining_plays = (height * width) - mines
    end

    def Minesweeper.remaining_plays
        @@remaining_plays
    end

    def Minesweeper.remaining_plays=(value)
        @@remaining_plays = value
    end

    def still_playing?
        @still_playing
    end

    def valid_play(x,y)
        return @board.field_valid(x,y) && !@board[x,y].is_checked? && !@board[x,y].is_flag?
    end

    def play(x, y)
        return false if !valid_play(x,y)

        if(@board[x,y].is_bomb?)
            @still_playing = false
            return true
        end
       
        @board[x,y].checked = true
        @@remaining_plays -= 1

        if @board[x,y].is_empty?
            @board.open_empty(x, y, true)
        end
        
        @still_playing = false if victory?

        return true
    end

    def flag(x, y)
        return false if !@board.field_valid(x,y)
            
        return false if @board[x,y].is_checked? || @flags == @mines

        if(@board[x,y].is_flag?)
            @board[x,y].flag = false
            @flags -= 1
        else
            @board[x,y].flag = true
            @flags += 1
        end

        return true
    end

    def victory?
        @@remaining_plays == 0
    end

    def get_styled_field(field, xray)
        if xray && field.is_bomb?
            return '#'
        end   
        #return (xray) ? '#' : '.' if field.is_bomb?
        return 'F' if field.is_flag?
        return '.' if !field.is_checked?
        return ' ' if field.is_empty?
        return field.value
    end

    def board_state(xray = false)
        xray = false if xray && still_playing?

        state = []
        for x in 0..@board.height-1
            aux = []
            for y in 0..@board.width-1
                aux.push(get_styled_field(@board[x,y], xray))
            end
            state.push(aux)
        end
        state
    end

end