# responsavel por pegar frases com o usuario e retornar ela em um vetor em ordem alfabética
module Phrase
    def self.insere_phrase(stopWords)
        system "clear"
        puts "Insira uma palavra ou frase para buscar titulos relacionados"
        frase= gets.chomp
        fraseRemodelada = stopWords.remove_stop_words(frase,stopWords.vectorLines)
        fraseRemodelada = stopWords.split_input(fraseRemodelada," ")
        fraseRemodelada = stopWords.sort_Alphabet(fraseRemodelada)
    end
end