
# game over message method 
def game_end(option)
    case option
        when "game_over"
            system "clear"
            puts "\n\n"
            puts "GAME OVER #{$sad}".center(150).red
            sleep(1)
            puts "See you next time...".center(150).red
            exit 
        when "congrats"
            system "clear"
            puts "\n"
            puts "Congratulations! Mr kitty is full of snacks and is resting peacefully.".center(150).green
            sleep(1)
            puts "Goodnight...see you next time!".center(150).green
            exit
    end
end