#encoding:UTF-8
require 'mini_exiftool'
t = MiniExiftool.new "DSC_0371.jpg"
#p t.to_hash
p t["FileModifyDate"]
p t["GPSLatitude"]
p t["GPSLongitude"]
