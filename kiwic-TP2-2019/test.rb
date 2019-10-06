require 'minitest/autorun'
require_relative './modules.rb'
require_relative './class/dblp.rb'

class HandleStringTest < Minitest::Test
    puts "Jujuba"
    def test_is_alphabetical?
        assert_equal ["likes", "shreck", "zodiac"], Arquivo.new.sort_Alphabet(Arquivo.new.split_input("Shreck likes zodiac", " "))
    end

    def test_split_string
        assert_equal ["shreck", "is", "a", "good", "boy"], Arquivo.new.split_input("Shreck is a good boy", " ")
    end

    def test_no_stop_words

    end

end


class ArquivoTest < Minitest::Test

    def test_is_read_working        
        assert_equal ["zodiac the book", "a really crazy dog", "xuxa just for kids", "shreck in so far far away", "bingo is his nameo zodiac"], Arquivo.new.openFile("arquivo","texto.txt")
    end

    def test_is_matching
        assert_equal ["zodiac the book", "bingo is his nameo zodiac"], Arquivo.new.matcheWords(["zodiac the book", "really crazy dog", "xuxa just for kids", "shreck in so far far away", "bingo is his nameo zodiac"], "zodiac")
    end

    def test_is_separated
        assert_equal [" a ", " is ", " the "], Arquivo.new.addSpace(["a", "is", "the"])
    end
end


class DblpAPITest < Minitest::Test

    def test_connection
        assert_equal 200, DblpAPI.new.search("test").code
    end


    
end
