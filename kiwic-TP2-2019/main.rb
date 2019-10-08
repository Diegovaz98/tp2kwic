require_relative "./class/dblp.rb"
require_relative "./class/arquivo.rb"
require_relative "./modules/phrase.rb"



system "clear"
puts    "       Deseja  pegar  as  frasea  de  onde?
        [1] Arquivo txt           [2]API"


escolha = gets.chomp.to_i




case escolha
    
when 1
    
    puts    "       Buscar Titulos especificos?
        [1] Sim             [2] Não"
    escolha = gets.chomp.to_i

    stopWords = Arquivo.new
    stopWords.openFile("recurso", "stop_words")
    
    arqBase = Arquivo.new
    arqBase.openFile("arquivo","texto")
    
    case escolha
        
    when 1
        
        #Código para pegar a frase de busca do usuário e transformar em vetor de busca
        frase = Phrase.insere_phrase(stopWords);

        #Código para abrir o arquivo onde queremos fazer a busca
        
        vectorTitle = []
        frase.each do |palavra|
            vectorTitle.concat arqBase.matche_words(arqBase.vectorLines,palavra)
        end
        
    when 2
        vectorTitle = arqBase.vectorLines
    end
    
    
    puts    "       Escolha o algoritmo: 
        [1] Kwic"
    escolha = gets.chomp.to_i
    
    case escolha
        
    when 1
        vectorPhraseShifted = []
        vectorTitle.each do |line|
            vectorPhraseShifted.concat arqBase.change(arqBase.split_input(arqBase.remove_stop_words(line, stopWords.vectorLines), " "))
        end
        
        puts "Digite o nome do arquivo de saida"
        
        newFile = gets.chomp
        arqBase.write_file(newFile, vectorPhraseShifted)
        
        puts "Seu arquivo de busca está pronto dentro da pasta: arquivo/#{newFile}.txt"
        
    end
    
when 2
    phrase = Arquivo.new
    vectorFrase = Phrase.insere_phrase(phrase)
    dblp = DblpAPI.new
    vectorFrase.each do |word|
        dblp.parseJSON(dblp.search(word))["result"]["hits"]["hit"].each do |item|
            puts item["info"]["title"].gsub! word, "*"+word+"*"
        end
    end
end
    