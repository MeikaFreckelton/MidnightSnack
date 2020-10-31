class StandardError
end



class WelcomeClass
    attr_accessor :name, :start_input, :answer
    

    def initialize
        @name = String
        @answer = String
        welcome
        
    end

    # validates that input given is 's'
    def input_validation(start_input) 
        start_input = start_input.strip
        raise StandardError, "Invalid, please type 's'." if start_input != "s"
        start_input
    end

    # gets 's' input to call validation method to validate input
    def ask_for_s
        "Please press 's' to start...".each_char {|c| print c.blue ; sleep(0.1)}
        puts "\n"
        start_input = gets.chomp
        input_validation(start_input)
    rescue StandardError => e
        puts "Invalid."
        retry
    end

    # welcome method with greeting, title and instructions
    def welcome 

        system "clear"
        puts "\n\n"
        @name = (ARGV.length > 0) && ARGV[0]  # command line argument, can write name when running program to skip the program asking you for your name 
        if !@name 
            "What is your name?".each_char {|c| print c.blue ; sleep(0.1)}
                puts "\n"
                @name = gets.chomp
        end 
        "Hi #{@name.each_char{|c| c.red}}, welcome to...\n".each_char {|c| print c.blue ; sleep(0.1)} # print greeting with name, print single char slowly and blue
            ARGV.clear
        $title_array.each {|line| print line.red ;sleep(0.1)} # print title slowly in colour
        puts "\n\n"  
        
        ask_for_s
    end

end


class MenuStart
    $prompt = TTY::Prompt.new


    def initialize
        system "clear"
        menu_screen

    end
    
    



    def menu_screen
        @choices = [
            {"instructions" => -> do instructions end},
            {"play" => -> do system "clear" end},
            {"exit" => -> do game_end("game_over") end },
            {name: "levels", disabled: '(coming soon)'},
            {name: "stats", disabled: '(coming soon)'},
        ]

        $prompt.select("Choose your destiny", @choices)

    end

    
    
        
    def instructions
        system "clear"
        break_arr = Array.new(45, "-").join(" ").magenta
        puts "\n\n"
        
        puts "INTSTRUCTIONS".red.bold
            sleep(1)
            puts break_arr
            puts "\n"
            sleep(1)
            "Oh no, mr kitty is starved but it is midnight and the humans are asleep...\n".each_char {|c| print c.blue ; sleep(0.025)}
            "You are his only hope in finding some yummy snacks.".each_char {|c| print c.blue ; sleep(0.025)}
            sleep(1)
            puts "\n\n"
            puts break_arr
            puts break_arr
            puts "\n"
            sleep(2)
        "Use the arrow keys to help navigate mr kitty through the path to find a midnight snack.\n".each_char {|c| print c.blue ; sleep(0.025)}
        "Look out for obstacles and be sure to avoid them.\n\n".each_char {|c| print c.blue ; sleep(0.025)}
            sleep(1)
            puts break_arr
            puts break_arr
            sleep(2)
            puts "\n"
        "When you think mr kitty is satisfied, help him choose a place to sleep and let him rest.\n\n".each_char {|c| print c.blue ; sleep(0.025)}
            sleep(1)
            puts break_arr
            puts break_arr
            sleep(2)
            puts "\n"
        "If you wish to quit the game at any time, type 'q'\n".each_char {|c| print c.red ; sleep(0.025)}
            puts break_arr
            puts break_arr
            sleep(4)
            puts "\n" 


        $prompt.yes?("Are you ready to begin?")
    end

    

end
    