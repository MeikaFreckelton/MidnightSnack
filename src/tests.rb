require 'test/unit'
require_relative './app.rb'

# require 'simplecov'
# SimpleCov.start

class GameTest < Test::Unit::TestCase
    CatGame
    def test_direction #testing the movement of keys
        assert_equal(CatGame.input("\e[A)"), @@board[@@y-=1][@@x])
    end

    def test_up #tests if right will move right
        # game = Catgame.new(board)
        assert_equal("up", @@y-=1)
    end

    def test_keys # tests if arrow key input will move user
        # game = CatGame.new(board)
        assert_equal("\e[A", @@y-=1)
    end

    def test_food #tests if when kitty in game eats food, the message is printed
        # game = CatGame.new(board)
        assert_equal((@@current_pos = $fish1),(print_message("fish")) )
    end

    def test_fail #prints if assertion is false
        assert_equal(false, "Assertion was false")
    end


end


#all of these tests should run without error at the current point in time