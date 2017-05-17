#encoding:UTF-8

require 'sqlite3'
require 'FileUtils'

include SQLite3

db = Database.new("travel")

begin

#ユーザーのサインアップ情報を受け取る(名前とメールアドレス、パスワード)仮の状態
#ユーザーにIDを入力してもらい、それをデータベースで確認し、ダブりがなければそのまま登録する
print("ユーザーIDを入力してください:")
user_id = gets.chomp
print("メールアドレスを入力してください:")
user_mail = gets.chomp
user_pass = "passward"
user_name = "A"


sql = "insert into user_info values('#{user_id}', '#{user_name}', '#{user_pass}', '#{user_mail}');"


  db.execute(sql)

rescue => error
  #matchメソッドはマッチしているときにブロックを実行する
  #ブロック変数はマッチ部分が入り、配列指定して1番目を指定するとグループ部分のみを指定可
  print("エラーが発生しました\n")
  error.to_s.match(/user_info\.(\w+)$/){ |md|
    print("この", md[1], "は既に使われています。\n")
  }
  retry
end

FileUtils.mkdir_p("./userlist/#{user_id}/travellist")

db.close
