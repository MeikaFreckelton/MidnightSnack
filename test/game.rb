require 'io/console'
require_relative './game_over.rb'

# class for main gameplay
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

    # prints board array
    def print_board()
        system "clear"
        puts @@board.map {|board| board.join(" ")}
    end


    #  method to move user 
    # had to add multiple statements to accomodate for multiple objects on board 
    # which caused problems. ie. having them all on the one statement caused the user to 
    # be able to go over the actual board layout objects and delete them during gameplay
    # although it is not DRY it is the only thing that worked
    def move(direction)
        @@board[@@y][@@x] = " "

        if 
            (direction == "right" && (@@board[@@y][@@x + 1] == " " or @@board[@@y][@@x + 1] == $fish1))
                @@x += 1

        elsif 
            (direction == "left" && (@@board[@@y][@@x - 1] == " " or @@board[@@y][@@x - 1] == $rat))
                @@x -= 1
        elsif 
            (direction == "left" && (@@board[@@y][@@x - 1] == $bed))
                @@x -= 1


        elsif 
            (direction == "up" && (@@board[@@y - 1][@@x] == " " or @@board[@@y - 1][@@x] == ($chicken or $rat or $fish1)))
                @@y -= 1
        elsif 
            (direction == "up" && (@@board[@@y - 1][@@x] == " " or @@board[@@y - 1][@@x] == ($mouse or $sleeping_head)))
                @@y -= 1


        elsif 
            (direction == "down" && (@@board[@@y + 1][@@x] == " " or @@board[@@y + 1][@@x] == ($fish1 or $rat)))
                @@y += 1
        end

        @@current_pos = @@board[@@y][@@x]
        @@board[@@y][@@x] = $cat
        print_board()

        # method that gets rid of emojis when eaten and to print game end messages 
        case @@current_pos
            when $fish1
                print_message("fish")
                # $fish1 = nil
            when $rat
                print_message("rat")
                # $rat = nil
            when $mouse
                print_message("mouse")
                # $mouse = nil
            when $chicken
                print_message("chicken")
                # $chicken = nil
            when $bed
                puts game_end("congrats")
            when $sleeping_head
                puts game_end("congrats")
        end


        # if user is near obstacle will print message
        if direction == "right" and @@board[@@y][@@x+1] == $dead_end
            print_message("dead_end")
        elsif direction == "right" and @@board[@@y][@@x+1] == $angry_kitty
            print_message("angry_kitty")
        elsif direction == "left" and @@board[@@y][@@x-1] == $hole
            print_message("hole")     
        elsif direction == "down" and @@board[@@y+1][@@x] == $angry_kitty
            print_message("angry_kitty")
        elsif direction == "up" and @@board[@@y-1][@@x] == $sleeping_head
            print_message("sleeping_head")
        elsif direction == "left" and @@board[@@y][@@x-2] == $bed
            print_message("bed")
        end
    end

    # allows for user to use arrow keys to move object
    def input()
        loop do
            case STDIN.getch()
            when "q" then game_end("game_over")
            when "\e"
                case STDIN.getch() 
                when '['
                    case STDIN.getch()       
                    when "A" then move("up")
                    when "B" then move("down")
                    when "C" then move("right")
                    when "D" then move("left")
                    end
                end
            end
                
        end
    end


    # method that informs user they are near the end
    def sleep_input
        puts "you may continue to sleep or you may turn back and find more food or a different place to sleep."
    end

    #method used to print messages when emoji is close to or on obstacles or food
    def print_message(message)
        case message
            when "chicken" 
                puts "Yay! you found a piece of chicken! Mr kitty is very pleased."
            when "rat"
                puts "A rat! Mr kitty had fun hunting it."
            when "fish"
                puts "Yay you found a fish swimming a pond!"
            when "mouse"
                puts "A mouse! Mr kitty had fun hunting it."
            when "sleeping_head"
                puts "Yay you found mr kitty's sleeping human."
                sleep_input
            when "bed"
                puts "Yay you found mr kitty's bed."
                sleep_input
            when "dead_end"
                puts "Oh no a dead end! turn back."
            when "hole"
                puts "Oh no, there's a hole in the ground! turn back."
            when "angry_kitty"
                puts "Oh no an angry kitty, turn back quick!"
        end
    end 
end