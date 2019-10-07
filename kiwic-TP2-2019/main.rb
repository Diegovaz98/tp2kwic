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
    frase = Phrase.insere_phrase(stopWords);
    #Código para abrir o arquivo onde queremos fazer a busca
    arqBase = Arquivo.new
    
    puts "Informe a pasta do arquivo"
    pasta =gets.chomp
    puts "Informe o nome do arquivo com sua extensão (exemplo: texto.txt)"
    nome =gets.chomp
    arqBase.openFile(pasta,nome)
    
    outputFile = Arquivo.new
    puts "Digite o nome do arquivo de saida"
    newFile = gets.chomp
    frase.each do |palavra|
        vetorTitle= arqBase.matche_words(arqBase.vectorLines,palavra)
       outputFile.write_file(newFile, vetorTitle)
    end

    puts "Seu arquivo de busca está pronto dentro da pasta: arquivos"

    
when 2
    phrase = Arquivo.new
    vectorFrase = Phrase.insere_phrase(phrase)
    dblp = dblpAPI.new
    vectorFrase.each do |word|
        dblp.parseJSON(dblp.search(word))["result"]["hits"]["hit"].each do |item|
            puts item["info"]["title"].gsub! word, "*"+word+"*"
        end
    end
end
    