require_relative '../interface/interfaceExp.rb'

class Sub < InterfaceExp

    @left =  InterfaceExp
    @right = InterfaceExp

    def initialize(l, r)
        @left = l
        @right = r
    end

    def printf
        @left.printf
        print (" - ")
        @right.printf;
    end

    def eval
        @left.eval - @right.eval
    end
    
end