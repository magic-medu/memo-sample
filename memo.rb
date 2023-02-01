require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.to_s.chomp

if memo_type == "1"
puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
file_name = gets.chomp
puts"メモの内容を記入して下さい。Ctrl+Dで保存します。"
memo = STDIN.read
CSV.open("#{file_name}.csv" , "w") do |csv|
csv.puts ["#{memo}"]
end

elsif memo_type == "2"
puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
file_name = gets.chomp
CSV.open("#{file_name}.csv" , "a") do |csv|
puts"メモの内容を編集して下さい。Ctrl+Dで保存します。"
memo = STDIN.read
csv.puts ["#{memo}"]
end

else
puts "error"
end