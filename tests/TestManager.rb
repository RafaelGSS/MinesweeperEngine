require_relative '../src/Minesweeper'

class TestManager

    def initialize

    end

    def run
        if !test_mines
            puts "error test_mines"
        end
        if !test_flags
            puts "error test_flags"
        end
        if !test_win
            puts "error test_win"
        end
    end

    def test_mines
        game = Minesweeper.new(width, height, mines)
    end

    def test_flags

    end
    
    def test_win

    end

end