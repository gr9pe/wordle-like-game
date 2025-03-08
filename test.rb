require 'minitest/autorun'
require_relative "game"

class Test_game_get_input < Minitest::Test
    def setup
        @game = Game.new
    end

    def test_get_input_valid
        STDIN.stub(:getch, "a") do
            assert_equal "a", @game.get_input
        end
    end

    def test_get_input_invalid
        STDIN.stub(:getch, "1") do
            assert_equal nil, @game.get_input
        end
    end
end
