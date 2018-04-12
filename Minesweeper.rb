require 'Board'

class Minesweeper
    attr_accessor :still_playing, :remaining_plays, :flags, :board

    def initialize(height, width, mines)
        @board  = Board.new(height, width, mines)
        @still_playing = true
        @flags = 0
        @remaining_plays = (height * width) - mines
    end

    def still_playing?
        @still_playing
    end

    def valid_play(x,y)
        return @board.field_valid(x,y) && !@board[x,y].is_checked? || !@board[x,y].is_flag?
    end

    def play(x, y)
        return false if !valid_play(x,y)

        if(@board[x,y].is_bomb?)
            @still_playing = false
            return true
        end
       
        @board[x,y].checked = true
        @remaining_plays -= 1

        @board.open_empty(x,y) if @board[x,y].is_empty?

        @still_playing = false if victory?

        return true
    end

    def flag(x, y)
        if(!@board.field_valid(x,y))
            return false

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
        @remaining_plays == 0
    end

    def board_state(xray = false)
    end
end
