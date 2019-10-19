require_relative '../interface/visitor.rb'

class Count < Visitor

    def visit(subject)
        contador = 0
        puts "chamou"
        puts "contando: #{contador}"

        unless subject.class == Lit
            contador = contador + 1
            contador = contador + self.visit(subject.left)
            contador = contador + self.visit(subject.right)
        else 
            contador
        end
    end
end