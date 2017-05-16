#encoding:UTF-8

require 'sqlite3'
require 'pp'

#ユーザーのサインアップ情報を受け取る(名前とメールアドレス、パスワード)仮の状態
#IDはこちらで決定する
user_id = 1
user_mail = "a@example.com"
user_pass = "passward"
user_name = "A"

include SQLite3

db = Database.new("travel")

sql = "insert into user_info values(#{user_id}, '#{user_name}', '#{user_pass}', '#{user_mail}');"

db.execute(sql)

db.execute("select * from user_info;") { |row| pp row}
