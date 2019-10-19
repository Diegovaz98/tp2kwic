require_relative '../interface/interfaceExp.rb'
require_relative '../module/verify.rb'
require_relative '../module/visitable.rb'

class Lit < InterfaceExp
   
    include Verify
    include Visitable
    attr_accessor :value; 
   
   def verify(v)
        if v.class==Fixnum
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

end
    