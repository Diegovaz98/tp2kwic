module Kwic
    def matcheWords(arquivo, palavra)
        @matching = []
        arquivo.each do |linha|
            if linha.include? palavra
                @matching.push(linha)   
            end
        end
        @matching
    end
end

module Sorting

    def sort_Alphabet(pesquisa)
        pesquisa.sort
    end

    def split_input(string, splitter)

        string.downcase.split(splitter);

    end
" is "
end    

class DblpAPI

    def acessar
    end
end
    
class Arquivo

    attr_accessor :vectorLines
    attr_accessor :matching
    
    include Kwic
    include Sorting

    def openFile(text)

        file = File.open("arquivo/"+text,"r")
        @dataLines=file.read
        file.close
        @vectorLines = split_input(@dataLines, "\n")
      
    end

    def copy_file
        frase = @dataLines
    end

end
    

