require_relative '../modules/search'
require_relative '../modules/handleString'
require_relative '../modules/changePhrase'


# class Frase
#     attr_accessor :matching
#     attr_accessor :stop_words
#     include HandleString
# end

class Arquivo

    attr_accessor :vectorLines
    attr_accessor :matching
    attr_accessor :stop_words
    attr_accessor :newLines

    include Search
    include HandleString
    include ChangePhrase 

    def openFile(folder, arquive)
        file = File.open(folder+"/"+arquive+".txt","r")
        @dataLines=file.read
        file.close
        @vectorLines = split_input(@dataLines, "\n")
    end
    
    def write_file(newfile, vector)
        vector.each do |phrase|
            file = File.open("arquivo/"+newfile+".txt", "w"){|file| file.write(phrase + "\n")}
        end
        newfile
    end



end