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

end   

module Basic
    
    def openFile(pasta, text)

        file = File.open(pasta+"/"+text,"r")
        @dataLines=file.read
        file.close
        @vectorLines = split_input(@dataLines, "\n")
    end
end

class DblpAPI

    def acessar
    end
end

class Stop_words

end

class Arquivo

    attr_accessor :vectorLines
    attr_accessor :matching
    attr_accessor :stop_words
    
    include Kwic
    include Sorting
    include Basic

    # def openFile(text)

    #     file = File.open("arquivo/"+text,"r")
    #     @dataLines=file.read
    #     file.close
    #     @vectorLines = split_input(@dataLines, "\n")
      
    # end

    def copy_file
        frase = @dataLines
    end

    def separate
        @stop_words = []
    end

end
    

