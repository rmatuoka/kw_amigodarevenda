class String
 def binhex
    self.unpack('H*').join("")
 end
 def unhex
    [self].pack("H*")
 end
 def escaped
    self.unpack("a").join("")
 end
end