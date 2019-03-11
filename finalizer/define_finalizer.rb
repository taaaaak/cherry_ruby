class DefineFinalizer
  def self.cleanup
    lambda { puts "finalized!" }
  end

  def initialize
    @a = "abcdefg" * 1024 * 1024 * 103
    ObjectSpace.define_finalizer(self, self.class.cleanup)
  end
end

1.upto 8 do |i|
  puts Time.now
  DefineFinalizer.new
  sleep 1
end

# https://www.google.com/search?q=failed+to+allocate+memory+(NoMemoryError)&oq=failed+to+allocate+memory+(NoMemoryError)&aqs=chrome..69i57j0l5.244j0j1&sourceid=chrome&ie=UTF-8
# vagrant@ubuntu-xenial:~/project/cherry_ruby/finalizer$ ruby define_finalizer.rb 
# 2019-03-12 01:38:26 +0900
# Traceback (most recent call last):
# define_finalizer.rb: failed to allocate memory (NoMemoryError)
