require 'minitest/autorun'
require_relative 'module/verify.rb'
require_relative 'interface/interfaceExp.rb'
require_relative 'class/add.rb'
require_relative 'class/sub.rb'
require_relative 'class/lit.rb'



class AddTest < Minitest::Test
    
    
    # def test_is_l
    #     lit = Lit.new(1)
    #     assert_equal 1, lit.eval
    # end

    def test_is_adding
        lit = Lit.new(2)
        lit2 = Lit.new(3)
        add = Add.new(lit, lit2)
        assert_equal 5, add.eval
    end 

    def test_add_and_sub
        lit = Lit.new(2)
        lit2 = Lit.new(6)
        sub = Sub.new(lit2, lit)
        add = Add.new(sub, lit2)
        assert_equal 10 , add.eval
    end

    # def test_is_r
    #     assert_equal (2) 
    # end
    # def test_is_adding
    #     assert_equal (3) 
    # end
end