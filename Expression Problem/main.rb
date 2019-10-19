require 'byebug'
require_relative './class/add.rb'
require_relative './class/lit.rb'
require_relative './class/sub.rb'
require_relative './class/eval.rb'  

lit = Lit.new(3)
lit2 = Lit.new(3)
lit3 = Lit.new(5)
sub = Sub.new(lit3, lit)
sub.accept(Eval.new)
# lit4 = Lit.new(sub.accept(SubEval.new))
# valor =sub.accept(SubEval.new)
add = Add.new(sub, sub)

puts add.accept(Eval.new) 

add.printf
# add = Add.new(lit, lit2)
#add = Add.new(sub, lit2)
