require_relative "./modules.rb"
require_relative "./class/dblp.rb"


puts "Escolha entre\n [1] Arquivo txt\n [2]API"
escolha = gets.chomp.to_i


case escolha

when 1
    # a = Arquivo.new
    # puts "Informe a pasta: "
    # pasta = gets.chomp
    # puts "Informe o nome do arquivo: "
    # nome = gets.chomp
    # a.openFile(pasta, nome);
    # puts "Seu aquivo aqui: "
    # a.matcheWords(a.vectorLines, "zodiac")

    #Código para pegar a frase de busca do usuário e transformar em vetor de busca
    stopWords = Arquivo.new
    stopWords.openFile("recurso", "stop_words.txt")
    frase = Phrase.insere_phrase(stopWords);
    #Código para abrir o arquivo onde queremos fazer a busca
    arqBase = Arquivo.new
    
    puts "Informe a pasta do arquivo"
    pasta =gets.chomp
    puts "Informe o nome do arquivo com sua extensão (exemplo: texto.txt)"
    nome =gets.chomp
    arqBase.openFile(pasta,nome)
    
    frase.each do |palavra|
        puts arqBase.matche_words(arqBase.vectorLines,palavra)
    end

    
when 2
    dblp = DblpAPI.new
    vectorFrase = Phrase.insere_phrase(dblp)
    vectorFrase.each do |word|
        dblp.parseJSON(dblp.search(word))["result"]["hits"]["hit"].each do |item|
            puts item["info"]["title"].gsub! word, "*"+word+"*"
        end
    end
end
    