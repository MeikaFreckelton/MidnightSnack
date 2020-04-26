require 'test/unit'
require_relative './app.rb'

class GameTest < Test::Unit::TestCase
    def test_left #testing the movement of keys
        game = CatGame.new(board)
        assert_equal("left", @@x-=1)
    end

    def test_up #tests if right will move right
        game = Catgame.new(board)
        assert_equal("up", @@y-=1)
    end

    def test_keys # tests if arrow key input will move user
        game = CatGame.new(board)
        assert_equal("\e[A", @@y-=1)
    end

    def test_fail 
        assert_equal(false, "Assertion was false")
    end

end