require "pry"
require"colorize"

class Player

	def initialize # requires names and symbols for each players
		puts
		puts "Entrez un nom pour le joueur 1"
		print "> "
		@name_player1 = gets.chomp.to_s.blue # require player1 name
		puts "Choisissez votre symbole, 1 charactere maximum"
		print "> "
		@sign_player1 = gets.chomp.to_s[0].blue # require player1 sign
		puts 
		puts "Entrez un nom pour le joueur 2"
		print "> "
		@name_player2 = gets.chomp.to_s.red # require player1 name
		puts "Choisissez votre symbole, 1 charactere maximum"
		print "> "
		@sign_player2 = gets.chomp.to_s[0].red # require player2 sign
		puts
		puts "Le partie opposera #{@name_player1} (#{@sign_player1}) à #{@name_player2} (#{@sign_player2})"
	
	end # method initialize

	

	def player1_name
		return @name_player1
	end

	def player1_sign
		return @sign_player1
	end

	def player2_name
		return @name_player2
	end

	def player2_sign
		return @sign_player2
	end

end # class Player