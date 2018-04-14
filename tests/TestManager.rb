require_relative '../src/Minesweeper'

class TestManager

    def run(victory=true)
        width = rand(20)+1
        height = rand(20)+1
        mines = rand(width*height)

        puts "Testando com matriz #{height} x #{width} e #{mines} minas"
        game = Minesweeper.new(width, height, mines)

        height_jg, width_jg = 0, 0
        while game.still_playing?
            if(victory)
                if !game.is_bomb(height_jg, width_jg)
                    game.play(height_jg, width_jg)
                end
            else
                if game.is_bomb(height_jg, width_jg)
                    game.play(height_jg, width_jg)
                end
            end
            
            width_jg += 1

            if(width_jg == width)
                width_jg = 0
                height_jg += 1
            end
        end

        if game.victory? && victory
            puts "Works! Victory TRUE"
        elsif !game.victory? && !victory
            puts "Works! Defeat TRUE"
        else
            puts "Error"
        end

    end
end