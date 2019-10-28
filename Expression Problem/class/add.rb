
require_relative '../interface/interfaceExp.rb'

class Add < InterfaceExp
    attr_accessor :left, :right

    def initialize(l, r)
        @left = l
        @right = r
    end

    def printf
        @left.printf
        print (" + ")
        @right.printf;
    end

    def accept(visitor)
        visitor.visitAdd(self)
    end
  
end