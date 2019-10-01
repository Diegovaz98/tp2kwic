
module Sorting

    def sort_Alphabet(pesquisa)
        pesquisa.sort
    end

    def split_input(string)

        string.downcase.split(" ");

    end

end    

module Search

    def searching

    end
end

class DblpAPI

    def acessar
    end
end
    
class Arquivo

    include Sorting

    def openFile(text)
        file = File.open("arquivo/"+text,"r")
        @dataLines=file.read
        file.close
        @dataLines
    end

    def copy_file
        frase = @dataLines
    end

end
    

puts "Escolha entre\n [1] Arquivo txt\n [2]API(por favor não)"
escolha = gets.chomp.to_i


case escolha

when 1
    puts "1"
when 2
    puts "2"
    # tratar API
end
    