require 'byebug'
require_relative './class/add.rb'
require_relative './class/lit.rb'
require_relative './class/sub.rb'


lit = Lit.new(83)
lit2 = Lit.new(23)
sub = Sub.new(lit2, lit)
# add = Add.new(lit, lit2)
add = Add.new(sub, lit2)

add.printf

puts "\n #{add.eval}"
