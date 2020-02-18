def le_nome
    nome = gets
    puts "lido #{nome} "
    nome
end

def pede_nome
    puts "digite seu nome"
    nome_lido = le_nome
    puts "Pedido!"
    nome_lido
end

def inicio
    nome = pede_nome
    puts "Bem vindo #{nome}"
    
    puts "Quero Conhecer mais alguem"
    nome2 = pede_nome
    puts "ola #{nome2}"
end

inicio