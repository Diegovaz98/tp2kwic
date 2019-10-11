require 'minitest/autorun'
require_relative 'module/verify.rb'
require_relative 'interface/interfaceExp.rb'
require_relative 'class/add.rb'
require_relative 'class/sub.rb'
require_relative 'class/lit.rb'



class AddTest < Minitest::Test
    
    #Teste Lit
    def test_is_lit
        lit = Lit.new(1)
        assert_equal 1, lit.eval
    end
    #Teste Add
    def test_is_adding
        lit = Lit.new(2)
        lit2 = Lit.new(3)
        add = Add.new(lit, lit2)
        assert_equal 5, add.eval
    end 
    #Teste Sub
    def test_is_sub
        lit = Lit.new(6)
        lit2 = Lit.new(8)
        sub = Sub.new(lit2, lit)
        assert_equal 2, sub.eval
    end
    
    #Teste Add com sub
    def test_add_and_sub
        lit = Lit.new(2)
        lit2 = Lit.new(6)
        sub = Sub.new(lit2, lit)
        add = Add.new(sub, lit2)
        assert_equal 10 , add.eval
    end

    #Teste Add com lit na direita
    def test_add_and_lit_right
        lit = Lit.new(4)
        lit2 = Lit.new(8)
        add = Add.new(lit,lit2)
        add2 = Add.new(add, lit2)
        assert_equal 20 , add2.eval
    end

    #Teste Add com lit na esquerda
    def test_add_and_lit_left
        lit = Lit.new(3)
        lit2 = Lit.new(5)
        add = Add.new(lit,lit2)
        add2 = Add.new(lit2,add)
        assert_equal 13 , add2.eval
    end

    #Teste sub com add
    def test_sub_and_add
        lit = Lit.new(15)
        lit2 = Lit.new(20)
        add = Add.new(lit, lit2)
        sub = Sub.new(add, lit)
        assert_equal 20 , sub.eval
    end

    #Teste sub com lit na direita
    def test_sub_and_lit_right
        lit = Lit.new(30)
        lit2 = Lit.new(7)
        sub1 = Sub.new(lit, lit2)
        sub2 = Sub.new(sub1, lit2)
        assert_equal  16, sub2.eval
    end

    #Teste sub com lit na esquerda
    def test_sub_and_lit_left
        lit = Lit.new(8)
        lit2 = Lit.new(50)
        sub1 = Sub.new(lit2,lit)
        sub2 = Sub.new(lit2,sub1)
        assert_equal  8, sub2.eval
    end

    #Teste sub com add com lit
    def test_sub_and_add_and_lit
        lit = Lit.new(12)
        lit2 = Lit.new(8)
        lit3 = Lit.new(5)
        lit4 = Lit.new(3)
        sub = Sub.new(lit, lit2)
        add = Add.new(lit3,sub)
        add2 = Add.new(add,lit4)
        assert_equal  12, add2.eval
    end 

    # def test_is_r
    #     assert_equal (2) 
    # end
    # def test_is_adding
    #     assert_equal (3) 
    # end
end