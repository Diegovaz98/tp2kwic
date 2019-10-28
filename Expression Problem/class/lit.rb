require_relative '../interface/interfaceExp.rb'

class Lit < InterfaceExp
   
    attr_accessor :value; 

    def initialize(v)
        @value = v
    end

    def printf
        print @value
    end

    def accept(visitor)
        visitor.visitLit(self)
    end

end
    