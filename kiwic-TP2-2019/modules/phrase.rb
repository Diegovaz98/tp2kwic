module Phrase
    def self.insere_phrase(stopWords)
        system "clear"
        puts "Insira uma palavra ou Frase para trazer titulos que contenham partes da frase nele"
        frase= gets.chomp
        fraseRemodelada = stopWords.remove_stop_words(frase,stopWords.vectorLines)
        fraseRemodelada = stopWords.split_input(fraseRemodelada," ")
        fraseRemodelada = stopWords.sort_Alphabet(fraseRemodelada)
    end
end