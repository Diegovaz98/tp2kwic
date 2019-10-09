require_relative '../interface/interfaceExp.rb'

class Lit < InterfaceExp
    def initialize(v)
        @value = v
    end

    def printf
        print (@value)
    end

    def eval
        @value
    end
end
    