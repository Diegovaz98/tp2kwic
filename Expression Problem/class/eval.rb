require_relative '../interface/visitor.rb'

class Eval < Visitor

    def visit(subject)

        if subject.class == Add
            return self.visit(subject.left) + self.visit(subject.right)
        end
        
        if subject.class == Sub
            return self.visit(subject.left) - self.visit(subject.right)
        end

        if subject.class == Lit
            return subject.value
        end
    end
end