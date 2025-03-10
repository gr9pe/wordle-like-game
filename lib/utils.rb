class Utils
    class << self
        def show_with_outline(*args)
            line = "-------------------------"
            puts line
            args.map {|item| puts item}
            puts line
        end

        def get_input_string
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


        def get_input_digit
            input = STDIN.getch
            if input == "\C-c"
                exit
            end
            if["0", "1", "2", "3", "０", "１", "２", "３"].include?(input)
                return input
            end
            nil
        end

        def get_words(file_name)
            file = File.open(file_name, "r")
            File.readlines(file_name, chomp: true)
        end

        def store_word(file_name, word)
            file = File.open(file_name, "a")
            file.puts(word)
            file.flush #読み書きが多いため、即座に反映
        end

        def store_words!(file_name, words)
            File.open(file_name, 'w') do |file|
                words.each { |word| file.puts(word) }
                file.flush #読み書きが多いため、即座に反映
            end
        end
    end
end