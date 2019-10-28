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
            file = File.open("saida/"+newfile+".txt", "a"){|file| file.write(phrase + "\n")}
        end
        newfile
    end

    def write_file_html(newfile, vector)
        
        File.open("saida/"+newfile+".html", "w") do |file|
             file.puts "<html> \n       <head> \n          <meta charset='utf-8'/>\n           <title>Saida</title> \n    </head> \n\n    <body> \n           <div style='margin: 30px; display: flex; justify-content: center;'>\n               <h1>Trabalho Kwic - TP2</h1>\n            
             </div>       <ol>\n"
        end

        vector.each do |phrase|
            file = File.open("saida/"+newfile+".html", "a"){|file| file.write("            <li>#{phrase} </li>\n")}
        end

        File.open("saida/"+newfile+".html", "a") do |file|
            file.puts "         </ol>\n     </body>\n</html>"
       end


    end

end