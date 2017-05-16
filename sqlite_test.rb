#encoding: UTF-8

require 'sqlite3'
require 'pp'

include SQLite3


db = Database.new("travel")

db.execute("select * from user_info;") { |row| pp row}

db.close
