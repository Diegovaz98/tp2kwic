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