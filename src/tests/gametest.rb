require 'test/unit'
require 'colorize'
require_relative '../welcome.rb'
require_relative '../title.rb'
require_relative '../game_over.rb'


class Apptest < Test::Unit::TestCase
    def test_start_game #tests whether name given in welcome class is empty, fails if name is empty
        assert_not_empty(WelcomeClass.new.name)
    end

    def test_start_input #tests whether the input entered is "s", fails if not
        assert_equal("s",WelcomeClass.new.start_input)
    end

    def test_y_or_n #tests whether input given is 'y' or 'n'
        assert_equal(("y" or "n"), WelcomeClass.new.answer)
    end
end