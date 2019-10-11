module ChangePhrase
    def kwic (vectorPhrase)

        palavras = vectorPhrase.length
        @newLines = []

        while palavras >  0 do 
            
            # método responsável por retirar a última palavra do vetor e colocá-la na primeira posição
            vectorPhrase = vectorPhrase.insert(0,vectorPhrase.delete_at(vectorPhrase.length-1))
            
            # método responsável por transformar o vetor em uma string
            @newLines.push(vectorPhrase.join(" ")) 
            palavras=palavras-1

        end 
        @newLines
    end   

    def kwoc (arqBase, frase, vectorTitle) 

        vectorTitlesFiltred = []
        frase.each do |palavra|

            # método responsável por  verificar se uma palavra se encontra em algum titulo
            vectorKey =  arqBase.matche_words(vectorTitle, palavra)
            tamanho = vectorKey.length

            if tamanho>0

                vectorKey.each do |phraseKey|

                    # método responsável por montar a string no formato KEY:  FRASE
                    vectorTitlesFiltred.push(palavra.upcase + ":   " +  phraseKey)
                end

            end
        end
        if vectorTitlesFiltred.length > 0
            return vectorTitlesFiltred
        else
            return false
        end
    end
end