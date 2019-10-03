
module Sorting

    def sort_Alphabet(pesquisa)
        pesquisa.sort
    end

    def split_input(string, splitter)

        string.downcase.split(splitter);

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
    attr_accessor :vectorLines
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
    

puts "Escolha entre\n [1] Arquivo txt\n [2]API(por favor não)"
escolha = gets.chomp.to_i


case escolha

when 1
    a = Arquivo.new
    puts "Informe o nome do arquivo: "
    a.openFile(gets.chomp);
    puts "Seu aquivo aqui: "
    a.vectorLines.each do |linha|
        puts linha
    end
when 2
    puts "2"
    # tratar API
end
    