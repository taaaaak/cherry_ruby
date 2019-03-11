class DefineFinalizerReviced
  def DefineFinalizerReviced.callback
    proc {
      puts "bar"
    }
  end
  def initialize
    ObjectSpace.define_finalizer(self, DefineFinalizerReviced.callback)
  end
end
DefineFinalizerReviced.new
GC.start
