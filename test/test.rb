require 'minitest/autorun'
require 'io/console'  
require_relative "../lib/utils"

class Test_utils_get_input < Minitest::Test

    def test_get_input_string1
        STDIN.stub(:getch, "a") do
            assert_equal "a", Utils.get_input_string
        end
    end

    def test_get_input_string2
        STDIN.stub(:getch, "1") do
            assert_equal nil, Utils.get_input_string
        end
    end

    def test_get_input_digit1
        STDIN.stub(:getch, "1") do
            assert_equal "1", Utils.get_input_digit
        end
    end

    def test_get_input_digit2
        STDIN.stub(:getch, "a") do
            assert_equal nil, Utils.get_input_digit
        end
    end
end
