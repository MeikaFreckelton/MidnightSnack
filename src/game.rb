require_relative './welcome_page.rb'
require_relative './gameover'

#assign variables
# q = 
# r =
# help = 


# main program
class CatGame
    attr_accessor :board
    def initialize(board)
        @@board = board
        @@posA = 1
        @@posB = 0
        @@current_pos = @@board[@@posA][@@posB]
        @@board[@@posA][@@posB] = $cat
        print_board()
        input()
    end
   
    def print_board()
        system("clear")
        puts @@board.map{ |board| board.join(" ") }
    end

    def input()
        loop do
            case STDIN.getch()
                when '['
                case STDIN.getch()
            # when '' then 
                    when 'A' then move("up")
                    when 'B' then move("down")
                    when 'C' then move("right")
                    when 'D' then move("left")
                end
            end
        end
    end


    def move(direction)
        @@board[@@posA][@@posB] = " "

        if (direction == "right" && (@@board[@@posA][@@posB + 1] == " " || @@board[@@posA][@@posB + 1] == $sleeping_head))
            @@posB += 1

        elsif (direction == "left" && @@board[@@posA][@@posB - 1] == " ")
            @@posB -= 1

        elsif (direction == "up" && @@board[@@posA - 1][@@posB] == " ")
            @@posA -= 1

        elsif (direction == "down" && @@board[@@posA + 1][@@posB] == " ")
            @@posA += 1
        end
    

        @@current_pos = @@board[@@posA][@@posB]
        @@board[@@posA][@@posB] = $player_icon
        print_board()
    end
end



    
    


# def type_slow(words)
#     words.each_char { |char| 
#     print char
#     sleep(0.05)
#     }
#     print "\n"
# end