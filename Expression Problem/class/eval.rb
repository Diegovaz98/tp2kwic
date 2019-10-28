require_relative '../interface/visitor.rb'

class Eval < Visitor

    def visitAdd(subject)
        if subject.class == Add
            return subject.left.accept(self) + subject.right.accept(self)
            # return self.visit(subject.left) + self.visit(subject.right)
        end
    end
    
    def visitSub(subject)
        if subject.class == Sub
            return subject.left.accept(self) - subject.right.accept(self)
            # return self.visit(subject.left) - self.visit(subject.right)
        end
    end

    def visitLit(subject)
        if subject.class == Lit
            return subject.value
        end
    end
end