require 'tty-prompt'
require 'tty-box'

prompt = TTY::Prompt.new


def testing_p
    puts TTY::Box.frame {
        "PLAY - TESTING SUCCESS"
    }
end

def testing_i
    puts "INSTRUCT - TESTING SUCCESS"
end



choices = [
    {"play" => -> do testing_p end},
    {"instructions" => -> do testing_i end},
    {"exit" => -> do exit end}
    ]
prompt.select("choose your destiny", choices)