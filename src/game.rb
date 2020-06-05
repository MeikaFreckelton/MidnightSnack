



class CatGame

    attr_reader :board

    def initialize(board)
        @@board = board
        @@y = 1
        @@x = 0
        @@current_pos = @@board[@@y][@@x]
        @@board[@@y][@@x] = $cat
        print_board()
        input()
    end

    def print_board() # prints board array
        system "clear"
        puts @@board.map {|board| board.join(" ").blue}
    end

    def print_message(message) #method used to print messages when emoji is close to or on obstacles or food
        case message
            when "chicken" 
                puts "Yay! you found a piece of chicken! Mr kitty is very pleased."
            when "rat"
                puts "A rat! Mr kitty likes to hunt."
            when "fish"
                puts "Yay you found a fish swimming a pond!"
            when "mouse"
                puts "A mouse! Mr kitty is happy."
            when "sleeping_head"
                puts "Yay you found mr kitty's sleeping human."
                puts "you may continue to sleep or you may turn back and find more food or a different place to sleep."
            when "bed"
                puts "Yay you found mr kitty's bed."
                puts "you may continue to sleep or you may turn back and find more food or a different place to sleep."
            when "dead_end"
                puts "Oh no a dead end! turn back."
            when "hole"
                puts "Oh no, there's a hole in the ground! turn back."
            when "angry_kitty"
                puts "Oh no an angry kitty, turn back quick!"
        end
    end 

    # moves user accross board
    def move_print(direction)
        @@board[@@y][@@x] = " "
        case direction
        when "A" # up
            if @@board[@@y - 1][@@x] == " " or @@board[@@y - 1][@@x] == ($chicken or $rat)
                @@y -= 1

            elsif @@board[@@y - 1][@@x] == " " or @@board[@@y - 1][@@x] == ($mouse or $fish1)
                @@y -= 1
            elsif @@board[@@y - 1][@@x] == " " or @@board[@@y - 1][@@x] == $sleeping_head
                @@y -= 1
            end

        when "B" # down
            if @@board[@@y + 1][@@x] == " " or @@board[@@y + 1][@@x] == ($fish1 or $rat)
                @@y += 1
            end

        when "C" #right
            if @@board[@@y][@@x + 1] == " " or @@board[@@y][@@x + 1] == $fish1
                @@x += 1
            end

        when "D" #left
            if @@board[@@y][@@x - 1] == " " or @@board[@@y][@@x - 1] == $rat
                @@x -= 1
            elsif @@board[@@y][@@x - 1] == " " or @@board[@@y][@@x - 1] == $bed
                @@x -= 1
            end
        end



        # updates current position, prints board again
        @@current_pos = @@board[@@y][@@x]
        @@board[@@y][@@x] = $cat
        print_board()

        case @@current_pos # gets rid of emojis when eaten and to print game end messages
        when $fish1
            print_message("fish")
        when $rat
            print_message("rat")
        when $mouse
            print_message("mouse")
        when $chicken
            print_message("chicken")
        when $bed
            puts game_end("congrats")
        when $sleeping_head
            puts game_end("congrats")
        end
        #  prints obstacle messages
        if direction == "C" and @@board[@@y][@@x+1] == $dead_end
            print_message("dead_end")
        elsif direction == "C" and @@board[@@y][@@x+1] == $angry_kitty
            print_message("angry_kitty")
        elsif direction == "D" and @@board[@@y][@@x-1] == $hole
            print_message("hole")     
        elsif direction == "B" and @@board[@@y+1][@@x] == $angry_kitty
            print_message("angry_kitty")
        elsif direction == "A" and @@board[@@y-1][@@x] == $sleeping_head
            print_message("sleeping_head")
        elsif direction == "D" and @@board[@@y][@@x-1] == $sleeping_head
            print_message("sleeping_head")
        elsif direction == "D" and @@board[@@y][@@x-2] == $bed
            print_message("bed")
        end
    end
    

    #takes input from arrow keys, then calls move method based on input
    def input()
        loop do   
            case STDIN.getch()
            when "q" then game_end("game_over")
            # when "r" then game = CatGame.new($BOARD2)
            when "\e"
                case STDIN.getch() 
                when "["
                    case STDIN.getch()          
                    when "A" then move_print("A")
                    when "B" then move_print("B")
                    when "C" then move_print("C")
                    when "D" then move_print("D")
                    end
                end
            end 
        end
    end
end
