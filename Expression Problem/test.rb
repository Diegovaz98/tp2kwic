require 'minitest/autorun'
require_relative 'module/verify.rb'
require_relative 'interface/interfaceExp.rb'
require_relative 'class/add.rb'
require_relative 'class/sub.rb'
require_relative 'class/lit.rb'



class AddTest < Minitest::Test
    lit = Lit.new(1)
    lit2 = Lit.new(2)  
    add =  Add.new(lit, lit2) 
    def test_is_l
        assert_equal (add),add.new
    end
    def test_is_r
        assert_equal (2) 
    end
    def test_is_adding
        assert_equal (3) 
    end
end