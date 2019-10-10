require_relative '../interface/interfaceExp.rb'
require_relative '../module/verify.rb'
class Lit < InterfaceExp
   
    include Verify
   
   def verify(v)
        if v.class==Integer
            return true
        else 
            raise "Tipo invalido"
        end
    end

    def initialize(v)
        if verify(v) 
            @value = v
        end
    end

    def printf
        print (@value)
    end

    def eval
        @value
    end
end
    