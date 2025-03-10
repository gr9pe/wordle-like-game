require 'minitest/autorun'
require 'io/console'  
require_relative "../lib/game"

class Test_game_select_filename < Minitest::Test

    def setup
        @game = Game.new([])
    end

    def test_select_filename_1
        assert_equal "./data/words_test.txt", @game.select_filename("0")
    end

    def test_select_filename_2
        assert_equal "./data/words_easy.txt", @game.select_filename("1")
    end

    def test_select_filename_3
        assert_equal "./data/words_nomal.txt", @game.select_filename("2")
    end

    def test_select_filename_4
        assert_equal "./data/words_hard.txt", @game.select_filename("3")
    end

    def test_select_filename_4
        assert_equal nil, @game.select_filename("a")
    end
end