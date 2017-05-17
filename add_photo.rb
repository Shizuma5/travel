#encoding:UTF-8

require 'sqlite3'
require 'FileUtils'
include SQLite3

db = Database.new("travel")

#アップロードされて送られてきた写真を受け取り、travellistに保存し、そのpathなどを
#データベースに保存する
#ここでは例でa.jpgを保存する

travel_name = gets.chomp
user_id = gets.chomp
#画像を保存するパス
dir_path = "./userlist/#{user_id}/travellist/#{travel_name}/"

#画像の保存先のディレクトリが存在しなければ作る(本番ではここでやる必要なし？)
FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)

photo_name = "a.jpg"
photo_path = dir_path + photo_name

#現ディレクトリにあるphoto_nameをphoto_pathに移動させる
FileUtils.mv(photo_name, photo_path)

#データベースに格納
sql = "insert into photo_info values('#{user_id}', '#{travel_name}', 'building', 'blue', '2017/5/17', 'California', '#{photo_path}');"

db.execute(sql)

db.execute("select * from photo_info") {|row| p row}

db.close
