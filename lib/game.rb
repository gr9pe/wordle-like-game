require "io/console"
require_relative "../lib/utils"

class Game
    attr_reader :word, :masked_word, :lives, :stack, :words_difficulty

    def initialize(used_words)
        @difficulty = select_difficulty
        @file_name = select_filename(@difficulty)
        @used_words = used_words
        @word = select_word(@file_name, @used_words)
        @masked_word = "_" * @word.length
        @lives = select_lives(@difficulty)
        @stack = []
    end

    def select_difficulty
        Utils.show_with_outline("難易度を選択してください", "簡単： 1", "普通： 2", "すごく難しい： 3", "テストモード(appleのみ)： 0")
        input = Utils.get_input_digit
        puts input
        if input == "0" || input == "1" || input == "2" || input == "3"
            input
        else
            "1"
        end
    end

    def select_filename(difficulty)
        case difficulty
        when "0" then "./data/words_test.txt"
        when "1" then "./data/words_easy.txt"
        when "2" then "./data/words_nomal.txt"
        when "3" then "./data/words_hard.txt"
        end
    end 

    def select_lives(difficulty)
        case difficulty
        when "0" then 3
        when "1" then 5
        when "2" then 7
        when "3" then 10
        end
    end

    def select_word(file_name, used_words)
        words = Utils.get_words(file_name).reject { |word| used_words.include?(word) }
        if words.empty?
            puts "出題できる単語がありません"
            exit
        end
        words.sample
    end

    def run
        while @lives > 0
            puts @masked_word
            puts @lives
        
            input = Utils.get_input_string
            if input.nil?
                next
            elsif @word.include?(input)
                @stack << input
                @masked_word = @word.gsub(/[^#{@stack.join}]/, "_")
            else
                @lives -= 1
            end
            
            if @masked_word == @word
                Utils.store_word("./data/results.txt",@word)
                break
            end
        end
        Utils.show_with_outline(@masked_word == @word ? "正解" : "不正解", "答えは...", @word)
        return @word
    end
end