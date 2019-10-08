module Search
    attr_accessor :matching 
    
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