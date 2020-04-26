require 'test/unit'
require_relative './app.rb'

class GameTest < Test::Unit::TestCase
    def test_name #test if name given is a string
        name = "meika"
        assert_equal(name, String)
    end

    def test_board #tests if the board given is in an array form
        game = Catgame.new(board)
        assert_equal(board, Array)
    end

    def test_fail 
        assert_equal(false, "Assertion was false")
    end

end