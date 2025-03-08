require "io/console"
class Game
    attr_reader :word, :masked_word, :lives, :stack

    def initialize
        @word = get_word
        @masked_word = "_" * @word.length
        @lives = 5
        @stack = []
    end

    def get_word
        words = ["word","apple","dog","silver","lion","game","cat","waffle","porcelain","vaseline"]
        return words.sample
    end
    
    def get_input
        input = STDIN.getch
        if input == "\C-c"
            exit
        end
        if input.match?(/[a-z]/i)
            return input.downcase
        end
        puts "アルファベットを入力してください"
        nil
    end

    def run
        while @lives > 0
            puts @masked_word
            puts @lives
        
            input = get_input
            if input.nil?
                next
            elsif @word.include?(input)
                @stack.push(input)
                @masked_word = @word.gsub(/[^#{@stack.join}]/, "_")
            else
                @lives -= 1
            end
            
            break if @masked_word == @word
        end
        
        puts "答え：" + @word
        exit
    end
end