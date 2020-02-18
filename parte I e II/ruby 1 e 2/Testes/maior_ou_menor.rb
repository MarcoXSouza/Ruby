def boas_vindas
	puts "Bem vindo ao jogo da advinhação"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "Começaremos o jogo para você, #{nome}"
	nome
end

def pede_dificuldade
	puts "Qual o nível de dificuldade que você deseja? (1 - fácil, 5 - difícil) "
	dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
	case dificuldade
	when 1
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end			
	puts "\n\n\nEscolhendo um número secreto entre 1 e #{maximo}..."

	sorteado = rand(maximo) + 1
	puts "Escolhido... Que tal adivinhar hoje nosso numero secreto?"
	sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
	puts "\n\n"
	puts "Tentativa #{tentativa} de #{limite_de_tentativas}" 
	puts "Chutes até agora: #{chutes}"
	puts "\nEntre com o numero" 
	chute = gets.strip
	puts "Sera que você acertou? Você chutou " + chute
	chute.to_i	
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = chute == numero_secreto 
	if acertou
		puts "Acertou!!!"
		return true
	end
	maior = numero_secreto >chute.to_i 
	if maior
		puts "O numero secreto é maior!!!"
	else
		puts "O numero secreto é menor!!!"	
	end
	false
end

def joga(nome, dificuldade)
numero_secreto = sorteia_numero_secreto dificuldade

pontos_ate_agora = 1000
limite_de_tentativas = 5
chutes = []

for tentativa in 1..limite_de_tentativas
	
	chute = pede_um_numero chutes, tentativa, limite_de_tentativas
	chutes << chute

	if nome == "marcos"
		puts "Acertou!!!"
		break
	end

	pontos_a_perder = (chute - numero_secreto).abs / 2.0

	pontos_ate_agora -= pontos_a_perder

	if verifica_se_acertou numero_secreto, chute
		break
	end
end

puts "Voce ganhou #{pontos_ate_agora} pontos!!!"

end

def nao_quer_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = boas_vindas
dificuldade = pede_dificuldade

loop do
	joga nome, dificuldade
	if nao_quer_jogar?
		break
	end
end















