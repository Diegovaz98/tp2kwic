require_relative '../interface/interfaceExp.rb'
require_relative '../module/verify.rb'
require_relative '../module/visitable.rb'

class Sub < InterfaceExp
    
    include Verify
    include Visitable
    attr_accessor :left, :right

    def initialize(l, r)
        # if verify(l,r)
            @left = l
            @right = r
        # end
    end

    def printf
        @left.printf
        print (" - ")
        @right.printf;
    end
    
end