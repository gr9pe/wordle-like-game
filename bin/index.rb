require_relative "../lib/game"
require_relative "../lib/utils"

continue = true
used_words = []

while (continue)
    game = Game.new(used_words)
    used_words.push(game.run)

    puts "もう一度遊びますか？ (y/n)"
    if STDIN.getch.downcase == "n"
        break
    end
end

results = Utils.get_words("./data/results.txt").uniq
unless results.empty?
    Utils.store_words!("./data/results.txt", results)
    Utils.show_with_outline("↓これまでに当てた単語↓", *results)
end