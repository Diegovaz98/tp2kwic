module Kwic
    #encontra dentro do vetor de frases uma palavra especificada pelo usuario
    def matche_words(vetorTexto, palavra)
        @matching = []
        vetorTexto.each do |linha|
            if linha.match(/\b#{palavra}\b/) 
                @matching.push(linha)   
            end
        end
        @matching
    end

end

module HandleString
    #recebe vectorPhrase, que é um array da frase que o usuario digitou, e coloca ele em ordem alfabetica
    def sort_Alphabet(vectorPhrase)
        vectorPhrase.sort
    end
    #recebe uma string e separa em posições no vetor
    def split_input(string, splitter)
        string.downcase.split(splitter);
    end

    #question = frase de busca do usuario; vectorStopWords = arquivo, em forma de vetor, de todas as stopsWords
    def remove_stop_words(question, vectorStopWords)
        vectorStopWords.each do |stopWord|
            if question.match(/\b#{stopWord}\b/)
                question.gsub! stopWord, ''
            end
        end
        question
    end

end

module Phrase
    def self.insere_phrase(stopWords)
        puts "Escreva a frase que voce procura"
        frase= gets.chomp
        fraseRemodelada = stopWords.remove_stop_words(frase,stopWords.vectorLines)
        fraseRemodelada = stopWords.split_input(fraseRemodelada," ")
        fraseRemodelada = stopWords.sort_Alphabet(fraseRemodelada)
    end
end

module Basic
    
    def openFile(folder, arquive)
        file = File.open(folder+"/"+arquive,"r")
        @dataLines=file.read
        file.close
        @vectorLines = split_input(@dataLines, "\n")
    end

    # def addSpace(vetorWords)
    #     @newVetor = []
    #     vetorWords.each do |word|
    #         @newVetor.push(word)          
    #     end
    #     vetorWords = @newVetor
    # end
end

class Frase
    attr_accessor :matching
    attr_accessor :stop_words
    include HandleString
end
class Arquivo

    attr_accessor :vectorLines
    attr_accessor :matching
    attr_accessor :stop_words
    
    include Kwic
    include HandleString
    include Basic
    
    # def separate
    #     @stop_words = []
    # end

end