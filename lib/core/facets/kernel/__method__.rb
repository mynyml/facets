module Kernel

  unless method_defined?(:__method__)  # 1.8.7+

    # Retreive the current running method name.
    #
    #   def tester; __method__; end
    #   tester  #=> :tester
    #
    # Technically __callee__ should provided alias names,
    # where __method__ should not. But we'll have to
    # leave that distinction to Ruby 1.9+.

    def __method__
      /\`([^\']+)\'/.match(caller(1).first)[1].to_sym
    end

    private :__method__

  end

  unless method_defined?(:__callee__)  # 1.9+

    # Retreive the current running method name.
    #
    #   def tester; __callee__; end
    #   tester  #=> :tester
    #
    # Technically __callee__ should provided alias names,
    # where as __method__ should not. But we'll have to
    # leave that distinction to Ruby 1.9+.

    def __callee__
      /\`([^\']+)\'/.match(caller(1).first)[1].to_sym
    end

    private :__callee__

  end

end

