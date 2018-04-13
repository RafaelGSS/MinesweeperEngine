class SimplePrinter

    def print(board)
        board.each do |row|
            row.each do |value|
               $stdout.print "[ #{value} ]"
            end
            puts
        end
    end
end