class SimplePrinter

    def print(board)
        puts "Simple Printer"
        board.each do |row|
            row.each do |value|
               $stdout.print "[ #{value} ]"
            end
            puts "\n"
        end
    end
end