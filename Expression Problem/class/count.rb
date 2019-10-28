require_relative '../interface/visitor.rb'

class Count < Visitor

    def visit(subject)

        contador = 0

        unless subject.class == Lit
            contador = contador + 1
            contador = contador + subject.left.accept(self)
            contador = contador + subject.right.accept(self)
        else 
            contador
        end
    end
end