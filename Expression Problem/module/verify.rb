module Verify
    def verify(l, r)
        if ((l.class.ancestors[2]== InterfaceExp)&&(r.class.ancestors[2]== InterfaceExp))
            return true
          else 
            return false
          end
    end
end