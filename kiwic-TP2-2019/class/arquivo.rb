require_relative '../modules/search'
require_relative '../modules/handleString'
require_relative '../modules/changePhrase'

class Arquivo

    attr_accessor :vectorLines
    attr_accessor :stop_words
    attr_accessor :newLines

    include Search
    include HandleString
    include ChangePhrase 

    # ler um arquivo e grava na memoria
    def openFile(folder, arquive)
        file = File.open(folder+"/"+arquive+".txt","r")
        @dataLines=file.read
        file.close
        @vectorLines = split_input(@dataLines, "\n")
    end
    
    # escreve o resultado em um arquivo
    def write_file(newfile, vector)
        vector.each do |phrase|
            file = File.open("arquivo/"+newfile+".txt", "a"){|file| file.write(phrase + "\n")}
        end
        newfile
    end

end