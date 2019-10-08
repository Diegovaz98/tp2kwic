module Phrase
    def self.insere_phrase(stopWords)
        puts "Escreva a frase que voce procura"
        frase= gets.chomp
        stopWords.openFile("recurso", "stop_words.txt")
        fraseRemodelada = stopWords.remove_stop_words(frase,stopWords.vectorLines)
        fraseRemodelada = stopWords.split_input(fraseRemodelada," ")
        fraseRemodelada = stopWords.sort_Alphabet(fraseRemodelada)
    end
end