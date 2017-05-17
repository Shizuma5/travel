#encoding_UTF-8

require 'sqlite3'
require 'pp'

include SQLite3

db = Database.new("travel")

#ユーザーID、パスワードを受け取り、照合を行う。
print("ユーザーIDを入力してください：")
user_id = gets.chomp
print("パスワードを入力してください：")
user_pass = gets.chomp

sql = "select ID, pass from user_info;"

db.execute(sql) { |row|
  if row[0] == user_id && row[1] == user_pass
    print("ログインに成功しました\n")
  else
    print("ログインに失敗しました。もう一度正しいIDとパスワードを入力してください。\n")
  end
}

db.close
