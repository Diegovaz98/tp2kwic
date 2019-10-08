require_relative '../modules/search'
require_relative '../modules/handleString'
require_relative '../modules/shiftPhrase'


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
    include ShiftPhrase 

    def openFile(folder, arquive)
        file = File.open(folder+"/"+arquive,"r")
        @dataLines=file.read
        file.close
        @vectorLines = split_input(@dataLines, "\n")
    end
    
    def write_file(newfile, vector)
        vector.each do |phrase|
        file = File.open("arquivo/"+newfile, "a"){|file| file.write(phrase + "\n")}
    
        end
    end

end