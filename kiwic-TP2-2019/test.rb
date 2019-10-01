require 'minitest/autorun'
require_relative './main'

class SortingTest < Minitest::Test
    puts "Jujuba"
    def test_is_alphabetical?
        assert_equal ["likes", "shreck", "zodiac"], Arquivo.new.sort_Alphabet(Arquivo.new.split_input("Shreck likes zodiac"))
    end

    def test_split_string
        assert_equal ["shreck", "is", "a", "good", "boy"], Arquivo.new.split_input("Shreck is a good boy")
    end

end


class ArquivoTest < Minitest::Test

    def test_is_read_working?        
        assert_equal "Zodiac the book\nA really crazy dog\nXuxa just for kids\nShreck in so far far away\nBingo is his nameo", Arquivo.new.openFile("texto.txt")
    end

end
