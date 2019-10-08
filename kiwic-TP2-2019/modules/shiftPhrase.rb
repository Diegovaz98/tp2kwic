module ShiftPhrase
    def altera (vectorPhrase)
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

end