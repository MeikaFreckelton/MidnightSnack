
# game over message method 
def game_end(option)
    case option
        when "game_over"
            system "clear"
            puts "Game over :("
            puts "See you next time..." 
            exit 
        when "congrats"
            system "clear"
            puts "Congratulations! Mr kitty is full of snacks and is resting peacefully."
            puts "Goodnight...see you next time!"
            exit
    end
end