require 'byebug'
require_relative "./class/dblp.rb"
require_relative "./class/arquivo.rb"
require_relative "./modules/phrase.rb"



system "clear"
puts    "       Deseja  pegar  as  frasea  de  onde?
        [1] Arquivo txt           [2]API"


escolha = gets.chomp.to_i



# Responsavel por escolher entre Buscar os titulos de um arquivo ou da API do dblo
case escolha
    
when 1
    system "clear"
    puts    "       Buscar Titulos especificos?
        [1] Sim             [2] Não"
    escolha = gets.chomp.to_i

    stopWords = Arquivo.new
    stopWords.openFile("recurso", "stop_words")
    
    arqBase = Arquivo.new
    arqBase.openFile("arquivo","texto")
    
    #Resposavel por ecolher se vai ou não filtrar os titulos nos quais o algoritmo será aplicado 
    
        

        
    
    system "clear"
    puts    "       Escolha o algoritmo: 
        [1] Kwic    [2]Kwac     [3]Kwoc"
    escolha = gets.chomp.to_i
    
    #Responsável por selecionar o algoritmo que vai ser aplicado no vetor de titulos
    case escolha
        
    when 1     #Kwic
        vectorTitle = arqBase.vectorLines
        vectorPhraseShifted = []
        vectorTitle.each do |line|
            vectorPhraseShifted.concat arqBase.kwic(arqBase.split_input(arqBase.remove_stop_words(line, stopWords.vectorLines), " "))
        end
        system "clear"
        puts "Digite o nome do arquivo de saida"
        

        vectorPhraseShiftedOrdenado=  arqBase.sort_Alphabet(vectorPhraseShifted)
        newFile = gets.chomp
        arqBase.write_file(newFile, vectorPhraseShiftedOrdenado)
        
        puts "Seu arquivo de busca está pronto dentro da pasta: arquivo/#{newFile}.txt"
       
    
    when 3 #Kwoc
        #Código para pegar a frase de busca do usuário e transformar em vetor de busca
        frase = Phrase.insere_phrase(stopWords);
        #Código para abrir o arquivo onde queremos fazer a busca
        vectorTitle = arqBase.Kwoc(arqBase,frase)
        system "clear"
        puts "Digite o nome do arquivo de saida"
        newFile = gets.chomp
        arqBase.write_file(newFile, vectorTitle)
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
    