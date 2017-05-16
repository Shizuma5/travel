#encoding:Shift_JIS

require 'mini_exiftool'
require 'pp'

start = Time.now

t = MiniExiftool.new("a.jpg")

print(Time.now - start, "\n\n")

pp t.to_hash
