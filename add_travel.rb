#encoding: UTF-8

require 'sqlite3'
require 'FileUtils'

include SQLite3

#旅行先の追加：ユーザーディレクトリの下にtravellistとその旅行名のディレクトリを作成
#それを重複がないようにデータベースにも保存

db = Database.new("travel")

begin

print("追加する旅行の名前を入力してください：")
travel_name = gets.chomp
print("IDを入力してください：")
user_id = gets.chomp

dir_path = "./userlist/#{user_id}/travellist/#{travel_name}"

FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)

sql = "insert into travel_info values('#{user_id}', '#{travel_name}')"

db.execute(sql)

rescue
  print("旅行名#{travel_name}は既に使われています\n異なる名前で登録してください\n")
  retry
end
