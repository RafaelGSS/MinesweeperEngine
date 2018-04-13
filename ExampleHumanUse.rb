require_relative 'src/Minesweeper'
require_relative 'src/SimplePrinter'
require_relative 'src/PrettyPrinter'

print "Insira a quantidade de linhas:"
height    = gets.chomp.to_i
print "\nInsira a quantidade de colunas:"
width     = gets.chomp.to_i
puts "\nInsira a quantidade de minas espalhadas:"
num_mines = gets.chomp.to_i

game = Minesweeper.new(width, height, num_mines)
printer = PrettyPrinter.new

while game.still_playing?
    puts "Insira a linha em seguida a coluna para abrir:"
    valid_move = game.play(gets.chomp.to_i, gets.chomp.to_i)
    puts "Voce deseja colocar uma bandeira ?(0 - Nao/1 - Sim)"
    want_flag = gets.chomp.to_i
    if(want_flag > 0)
        puts "Insira a linha em seguida a coluna para colocar uma bandeira:"
        valid_flag = game.flag(gets.chomp.to_i, gets.chomp.to_i)
        if(!valid_flag)
            puts "Bandeira invalida"
        end
    end

    if valid_move
        printer.print(game.board_state)
    else
        puts "Jogada invalida!"
    end
end

puts "Fim do jogo!"
if game.victory?
  puts "Você venceu!"
else
  puts "Você perdeu! As minas eram:"
  PrettyPrinter.new.print(game.board_state(xray: true))
end