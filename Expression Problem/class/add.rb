
require_relative '../interface/interfaceExp.rb'
require_relative '../module/verify.rb'

class Add < InterfaceExp
    include Verify
    


    @left =  InterfaceExp
    @right = InterfaceExp



    def initialize(l, r)
        if verify(l,r)
            puts "Entrou"  
            @left = l
            @right = r
        end
    end


    def printf
        @left.printf
        print (" + ")
        @right.printf;
    end

    def eval
        @left.eval + @right.eval
    end
  
end