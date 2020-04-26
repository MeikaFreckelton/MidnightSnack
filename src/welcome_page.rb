# require_relative './title.rb'
# # method for the opening screen, greeting and instructions
# def welcome 
#     puts "Welcome to\n"
#     puts $title_array

#     puts "Please press enter to continue..."
#     enter_input = gets.strip
#         if enter_input != "enter"
#             puts "Invalid, please press enter to continue..."
#         else
#             puts "Oh no, mr kitty is starved but it is midnight and the humans are asleep...\nyou are his only hope in finding some yummy snacks.\n\n"
   
#             puts "Use the arrow keys to help navigate mr kitty through the path to find a midnight snack.\nLook out for obstacles and be sure to avoid them.\n"
#             puts "When you think mr kitty is satisfied, help him to bed and let him sleep.\n\n"

#             puts "If you wish to quit the game at any time, type 'q'"
#             puts "If you wish to restart the game at any time, type 'r'"
#             puts "if you need help at any time, type 'help'"
#         end
# end

# welcome


# print welcome to 
# print midnight snack text art for 3 seconds
# system clear
# oh no, mr kitty is starved but it is midnight and the humans are asleep...
# you are his only hope in finding some yummy snacks. / #help him find some snacks to fill his tummy.

# use the arrow keys to move mr kitty through the
# paths which will appear below. 

# If you wish to quit the game at any time, type "q"
# to quit. 
# If you wish to restart the game at any time, type "r"
# if you need help at any time, type "help"

# do you wish to begin?('yes' or 'no')
# user input


def read_char
    # STDIN.echo = false
    # STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then 
        input << STDIN.read_nonblock(3) rescue nil
        input << STDIN.read_nonblock(2) rescue nil
    end

ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
end

def show_single_key
    c = read_char

    case c
    when "\e"
        puts "ESCAPE"
    when "\e[A"
        puts "UP ARROW"
    when "\e[B"
        puts "DOWN ARROW"
    when "\e[C"
        puts "RIGHT ARROW"
    when "\e[D"
        puts "LEFT ARROW"
    end
end

puts show_single_key