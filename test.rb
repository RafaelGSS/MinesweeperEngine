require_relative 'Minesweeper'
require_relative 'SimplePrinter'
require_relative 'PrettyPrinter'

width, height, num_mines = 10, 20, 50
game = Minesweeper.new(height,width, num_mines)


while game.still_playing?
  puts "Escolha um movimento: "
  valid_move = game.play(gets.chomp.to_i, gets.chomp.to_i)
  puts "Escolha uma flag: "
  valid_flag = game.flag(gets.chomp.to_i, gets.chomp.to_i) 
  if valid_move or valid_flag
    printer = (rand > 0.5) ? SimplePrinter.new : PrettyPrinter.new
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

