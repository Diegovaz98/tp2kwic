require_relative "./modules.rb"



puts "Escolha entre\n [1] Arquivo txt\n [2]API(por favor não)"
escolha = gets.chomp.to_i


case escolha

when 1
    # a = Arquivo.new
    # puts "Informe a pasta: "
    # pasta = gets.chomp
    # puts "Informe o nome do arquivo: "
    # nome = gets.chomp
    # a.openFile(pasta, nome);
    # puts "Seu aquivo aqui: "
    # a.matcheWords(a.vectorLines, "zodiac")

    b = Arquivo.new
    b.openFile("recurso", "stop_words.txt")
    b.separar(b.vectorLines)
when 2
    puts "2"
    # tratar API
end
    