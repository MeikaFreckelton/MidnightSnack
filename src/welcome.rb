class StandardError
end

def welcome # welcome method with greeting, title and instructions
    system "clear"
    puts "\n\n"
    name = (ARGV.length > 0) && ARGV[0]  #command line argument, can write name when running program to skip the program asking you for your name 
    if !name 
        "What is your name?".each_char {|c| print c.blue ; sleep(0.1)}
            puts "\n"
            name = gets.chomp
    end 

    "Hi #{name.each_char{|c| c.red}}, welcome to...\n".each_char {|c| print c.blue ; sleep(0.1)} # print greeting with name, print single char slowly and blue
        ARGV.clear
    $title_array.each {|line| print line.red ;sleep(0.1)} #print title slowly in colour
    puts "\n\n"  



    def input_validation(start_input)
        start_input = start_input.strip
        raise StandardError, "Invalid, please type 's'." if start_input != "s"
        start_input
    end
    
    def ask_for_s
        "Please press 's' to start...".each_char {|c| print c.blue ; sleep(0.1)}
        start_input = gets.chomp
        input_validation(start_input)
    rescue StandardError => e
        puts "Invalid."
        retry
    end
    ask_for_s


    system "clear"

    break_arr = Array.new(45, "-")
    
        puts "\n\n"
    puts "INTSTRUCTIONS".red.bold
        sleep(1)
        puts break_arr.join(" ").magenta
        sleep(1)
        puts "\n"
    puts "Oh no, mr kitty is starved but it is midnight and the humans are asleep...".blue
    puts "you are his only hope in finding some yummy snacks.\n".blue
        puts break_arr.join(" ").magenta
        puts "\n"
        sleep(4)
    puts "Use the arrow keys to help navigate mr kitty through the path to find a midnight snack.".blue
    puts "Look out for obstacles and be sure to avoid them.\n".blue
        sleep(1)
        puts break_arr.join(" ").magenta
        sleep(3)
        puts "\n"
    puts "When you think mr kitty is satisfied, help him choose a place to sleep and let him rest.\n".blue
        sleep(1)
        puts break_arr.join(" ").magenta
        sleep(3)
        puts "\n"
    puts "If you wish to quit the game at any time, type 'q'\n".red
        puts break_arr.join(" ").magenta
        sleep(4)
        puts "\n"
end



def validate_answer(answer)
    answer = answer.strip
    raise StandardError, "Invalid, 'y' or 'n':" if answer != "y" and answer != "n" #or if answer != "n" #if answer != "n"
    answer
end




def ready_or_not
    puts "are you ready to begin?('y' or 'n')".green
    answer = gets.strip
    validate_answer(answer)
        if answer == "n"
            game_end("game_over")
        end
rescue  => e
    puts e.message
retry
end
    

# cd desktop/terminal_app/test
# cd desktop/terminal_app/src