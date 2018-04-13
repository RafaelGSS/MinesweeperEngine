class PrettyPrinter

    def print(board)

        puts "====================================="
        puts " Fase 2 Quero Educacao, la vamos nos!"
        puts "=====================================\n"
        $stdout.print "  "
        board.each_with_index do |row, idx|
            row.each_with_index do |value, idx2|
               printf '  %2d ', idx2
            end
            break
        end
        
        puts
        board.each_with_index do |row, idx|
            printf "%2d-", idx
            row.each do |value|
               $stdout.print "[ #{value} ]"
            end
            puts
        end
    end
end