require_relative 'src/Minesweeper'
require_relative 'src/SimplePrinter'
require_relative 'src/PrettyPrinter'

width, height, num_mines = 10, 20, 50
game = Minesweeper.new(width, height, num_mines)

while game.still_playing?
  valid_move = game.play(rand(height), rand(width))
  valid_flag = game.flag(rand(height), rand(width))
  if valid_move or valid_flag
    printer = (rand > 0.5) ? SimplePrinter.new : PrettyPrinter.new
    printer.print(game.board_state)
  end
end

puts "Fim do jogo!"
if game.victory?
  puts "Você venceu!"
else
  puts "Você perdeu! As minas eram:"
  PrettyPrinter.new.print(game.board_state(xray: true))
end