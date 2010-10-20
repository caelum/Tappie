module Tappie
  
  # taps and returns the object itself.
  #
  # if the block has arity one, the object will be passed as an argument.
  # if the block has no arity, the object is the scope (old style).
  # if there is no block, just taps (why, why?).
  def tap(&block)
    if block_given?
      if block.arity==1
        yield self
      else
        self.instance_eval(&block)
      end
    end
    self
  end
end

class Object
  include Tappie
end