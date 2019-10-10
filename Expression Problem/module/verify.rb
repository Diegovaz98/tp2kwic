module Verify
    def verify(l, r)
        if ((l.class.ancestors[2]== InterfaceExp)&&(r.class.ancestors[2]== InterfaceExp))
            return true
          else 
            raise "tipo de dado invalido"
          end
    end
end