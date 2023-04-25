def write_line(str, speed)
  for i in 0..str.length-1
    print str[i]
    sleep(speed)
  end
  print "\n"  
end


def write(str)
  str.each_char do |char|
    print char
    sleep 0.02
  end
end


def write_long(str)
  str.each_char do |char|
    print char
    sleep 0.1
  end
end

def write_blink(str, speed, time) #MERCI EMMANUEL
  time.times do
    print "\r#{ str }"
    sleep (speed)
    print "\r#{ ' ' * str.size }" # Send return and however many spaces are needed.
    sleep (speed)
  end
  print "\r#{ str }\n"
end
