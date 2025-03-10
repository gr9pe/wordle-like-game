require 'natto'

input_file = 'data/words.txt'
output_file = 'data/words_hard.txt'
nm = Natto::MeCab.new

words = []
File.open(input_file, 'r') do |file|
  file.each_line do |line|
    nm.parse(line) do |node|
      next if node.surface == "BOS/EOS" || node.surface.strip.empty?

      word = node.surface
      features = node.feature.split(',') #品詞情報
      pos = features[0] #品詞
      base_form = features[6] != '*' ? features[6] : word #原型取得
      if pos == "名詞"
        if base_form !~ /^un|.*(s|est|ly|ing|ed|ness|ism|ist|ical|ial|able|ility|ic|ize|ion|ional|tion|ance|ment|tive|ible)$/ #接尾辞の除外
          words << base_form
        end
      end
    end
  end
end

if words.empty?
  puts "抽出された単語がありません"
else
  words.sort!
  File.open(output_file, 'w') do |out|
    out.puts words
  end
  puts "おわり"
end
