require_relative "./modules.rb"



puts "Escolha entre\n [1] Arquivo txt\n [2]API(por favor não)"
escolha = gets.chomp.to_i


case escolha

when 1
    a = Arquivo.new
    puts "Informe o nome do arquivo: "
    a.openFile(gets.chomp);
    puts "Seu aquivo aqui: "
    a.matcheWords(a.vectorLines, "zodiac")
when 2
    puts "2"
    # tratar API
end
    