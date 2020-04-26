require_relative './title'
# require 'rubygems'
# require 'colorize'
# require 'colorized_string'
# String.disable_colorization = false

# system clear after a couple of seconds



# welcome method with greeting, title and instructions
def welcome
    system "clear"
    #command line argument, can write name when running program to skip the program asking you for your name
    name = (ARGV.length > 0) && ARGV[0]
        if !name
            "what is your name?".each_char {|c| print c.blue ; sleep(0.1)}
            puts "\n"
            name = gets.chomp
        end
    
    # print greeting with name, print single char slowly and blue
    "Hi #{name}, welcome to...\n".each_char {|c| print c.blue ; sleep(0.1)}

    $title_array.each {|line| print line;sleep(0.1)} #print title slowly in colour
    puts "\n\n" 
    
    puts  "Please press 's' to start..."
    start_input = gets.strip
    
    continue = true
    while continue
        if start_input == "s"
            continue = false
        else 
            puts "Invalid, please press 's'." 
            break
    end

    system "clear"

    break_arr = Array.new(60, "-")

    puts "Oh no, mr kitty is starved but it is midnight and the humans are asleep...".blue
    puts "you are his only hope in finding some yummy snacks.\n".blue
        puts break_arr.join("")
        puts "\n"
        sleep(4)
    puts "Use the arrow keys to help navigate mr kitty through the path to find a midnight snack.".blue
    puts "Look out for obstacles and be sure to avoid them.\n".blue
        puts break_arr.join("")
        sleep(3)
        puts "\n"
    puts "When you think mr kitty is satisfied, help him choose a place to sleep and let him rest.\n".blue
        puts break_arr.join("")
        sleep(4)
        puts "\n"
    puts "If you wish to quit the game at any time, type 'q'".red
        # puts break_array.join("")
        sleep(3)
    puts "If you wish to restart the game at any time, type 'r'".red
    # puts break_array.join("")
        sleep(3)
    puts "if you need help at any time, type 'help'".red
    puts break_arr.join("")
        sleep(4)
        puts "\n"
    puts "Are you ready to begin?('y' or 'n')"
    answer = gets.strip
    loop do 
        if answer == 'y'
            break loop
        elsif answer == 'n'
            game_end("game_over")
            break
        else 
            puts "invalid. please type 'y' or 'n'"
            break
        end
    end
end
end