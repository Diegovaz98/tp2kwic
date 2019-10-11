    require_relative "./class/dblp.rb"
    require_relative "./class/arquivo.rb"
    require_relative "./modules/phrase.rb"

    stopWords = Arquivo.new
    stopWords.openFile("recurso", "stop_words")
    vectorTitle = []
    arqBase = Arquivo.new

    # Responsavel por escolher entre Buscar os titulos de um arquivo ou da API do dblp
    system "clear"
    puts    "       Deseja  pegar  as  frasea  de  onde?
            [1] Arquivo txt           [2]API"


    escolha = gets.chomp.to_i


    case escolha
        
    when 1
        vectorTitle = arqBase.openFile("arquivo","texto")
    when 2
        
        # método responsável por pegar uma frase do usuario
        vectorFrase = Phrase.insere_phrase(stopWords)
        dblp = DblpAPI.new

        vectorFrase.each do |word|
        
            # métodos responsáveis por buscar cada palavra da frase do usuário na api e tranformar a busca em um json
            dblp.parseJSON(dblp.search(word)).each do |item|
        
                # método responsável por colocar cada frase que veio do json em um vetor, em caixa baixa
                vectorTitle.push(item["info"]["title"].downcase) 
        
            end
        end
    end

    #Responsável por selecionar o algoritmo que vai ser aplicado no vetor de titulos
    system "clear"
    puts    "       Escolha o algoritmo: 
        [1] Kwic              [2]Kwoc"
    escolha = gets.chomp.to_i

    case escolha
        
    when 1      #Kwic
        vectorPhraseShifted = []

        # metodo responsável por shiftar a frase
        vectorTitle.each do |line|
            vectorPhraseShifted.concat arqBase.kwic(arqBase.split_input(arqBase.remove_stop_words(line, stopWords.vectorLines), " "))
        end

        # método responsável por ordenar o resultado do algoritmo kwic
        vectorPhraseShiftedOrdenado=  arqBase.sort_Alphabet(vectorPhraseShifted)
        
        system "clear"
        puts "Digite o nome do arquivo de saida"
        newFile = gets.chomp

        # método responsável por escrever o resultado em um arquivo
        arqBase.write_file(newFile, vectorPhraseShiftedOrdenado)
            
        puts "Seu arquivo de busca está pronto dentro da pasta: arquivo/#{newFile}.txt"
        
    when 2      #Kwoc
        #métedo responsável por pegar a frase do usuário e transformar em um vetor, sem stopwords
        frase = Phrase.insere_phrase(stopWords);

        #Código para buscar titulos que estejam relacionados com a frase do usuário
        vectorTitle = arqBase.kwoc(arqBase, frase, vectorTitle)

        if vectorTitle == false
        
            puts "não foi encontrado nenhum título com a frase informada =("
        
        else

            system "clear"
            puts "Digite o nome do arquivo de saida"
            newFile = gets.chomp
            
            # método responsável por escrever o resultado em um arquivo
            arqBase.write_file(newFile, vectorTitle)    
            
            puts "Seu arquivo de busca está pronto dentro da pasta: arquivo/#{newFile}.txt"

        end
    end
