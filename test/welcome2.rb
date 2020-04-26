


class Welcome


    def validate_name(name)
        name = name.strip
        raise InvalidNameError, "Invalid, name can not be empty.", if name.empty?
        name
    end

    def get_name
            "what is your name?".each_char {|c| print c.blue ; sleep(0.1)}
            puts "\n"
            name1 = gets.chomp
        validate_name(name1)
    rescue InvalidNameError => e
        puts "Invalid name, must not be empty."
        retry
    end


    def initialize()
    # name = (ARGV.length > 0) && ARGV[0]
    #     if !name 
    #         puts get_name
    #     end 
        puts "initialized"
    end

    

    name = (ARGV.length > 0) && ARGV[0]  #command line argument, can write name when running program to skip the program asking you for your name 
    if !name 
        get_name
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

    break_arr = Array.new(60, "-")
    
        puts "\n\n"
    puts "INTSTRUCTIONS".red
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
        sleep(1.5)
        puts break_arr.join(" ").magenta
        sleep(3)
        puts "\n"
    puts "When you think mr kitty is satisfied, help him choose a place to sleep and let him rest.\n".blue
        sleep(1.5)
        puts break_arr.join(" ").magenta
        sleep(4)
        puts "\n"
    puts "If you wish to quit the game at any time, type 'q'".red
        sleep(2)
    puts "If you wish to restart the game at any time, type 'r'".red
        sleep(2)
    puts "if you need help at any time, type 'help'\n".red
        puts break_arr.join(" ").magenta
        sleep(4)
        puts "\n"
    puts "Are you ready to begin?('y' or 'n')".green
        answer = gets.chomp.to_s









end
end
