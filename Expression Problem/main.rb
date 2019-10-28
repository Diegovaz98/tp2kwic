require 'byebug'
require_relative './class/add.rb'
require_relative './class/lit.rb'
require_relative './class/sub.rb'
require_relative './class/eval.rb'  
require_relative './class/count.rb'  

lit = Lit.new(3)
lit2 = Lit.new(3)
lit3 = Lit.new(5)
# sub.accept(Eval.new)
add = Add.new(lit2, lit)
sub = Sub.new(add, add)
# add = Add.new(sub, sub)
# sub.accept(Count.new)

# puts add.accept(Eval.new)
puts "Resultado da subtatração de duas somas: #{sub.accept(Eval.new)}"
# puts add.accept(Count.new) 
# sub.printf
sub.printf
puts