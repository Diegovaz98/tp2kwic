require 'byebug'
require_relative './class/add.rb'
require_relative './class/lit.rb'
require_relative './class/sub.rb'

lit = Lit.new(6)
lit2 = Lit.new(7)
lit.printf
puts
lit2.printf
puts
sub = Sub.new(lit2, lit)
sub.printf
puts "" 
add = Add.new(sub, lit)

add.printf

puts "\n #{add.eval}"
