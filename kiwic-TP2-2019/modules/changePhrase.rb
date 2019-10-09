module ChangePhrase
    def kwic (vectorPhrase)
        palavras = vectorPhrase.length
        @newLines = []
        while palavras >  0 do 
            #auxiliar = vectorPhrase.last
            vectorPhrase = vectorPhrase.insert(0,vectorPhrase.delete_at(vectorPhrase.length-1))
            @newLines.push(vectorPhrase.join(" ")) 
            palavras=palavras-1

            # print vectorPhrase
        end 
        # puts @newLines
        @newLines
    end   

    def kwoc (arqBase,frase)
        vectorTitle= [] 
        frase.each do |palavra|
            vectorKey =  arqBase.matche_words(arqBase.vectorLines,palavra)
            tamanho = vectorKey.length
            if tamanho>0
                vectorKey.each do |phraseKey|
                    vectorTitle.push(palavra.upcase + ":   " +  phraseKey)
                end
            end
        end
        vectorTitle
    end
end