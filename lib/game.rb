require "pry"
require"colorize"

class Game

	def initialize(player1_name, player1_sign, player2_name, player2_sign, games_count, player1_win_count, player2_win_count)

		#initialize game board
		@game_hash = {
		"A1" => " ",
		"A2" => " ",
		"A3" => " ",
		"B1" => " ",
		"B2" => " ",
		"B3" => " ",
		"C1" => " ",
		"C2" => " ",
		"C3" => " ",
		}

		#initialize players names and signs
		@player1_name = player1_name
		@player1_sign = player1_sign
		@player2_name = player2_name
		@player2_sign = player2_sign

		#initialize game count to know how many round were played
		@games_count = games_count
	
	end # method initialize

	def one_turn # perform one turn for each players

		def show_game_visual # print current board
			puts"

   A   |   B   |   C

       ║       ║       
   #{@game_hash["A1"]}   ║   #{@game_hash["B1"]}   ║   #{@game_hash["C1"]}      1
       ║       ║       
═══════╬═══════╬═══════   -
       ║       ║       
   #{@game_hash["A2"]}   ║   #{@game_hash["B2"]}   ║   #{@game_hash["C2"]}      2
       ║       ║       
═══════╬═══════╬═══════   -
       ║       ║       
   #{@game_hash["A3"]}   ║   #{@game_hash["B3"]}   ║   #{@game_hash["C3"]}      3
       ║       ║       
"
		end # method shoz_game_visual

		def check_victory(player_name, player_sign, player_win_count) # check if victory or equality

			# beginning of equality checking
			i = 0  

			@game_hash.each do |block|
				
				if (block.to_a)[1] != " "
					i += 1
				end
			end

			if i == 9
				puts "Égalité !"
				replay
			end
			# end of equality checking

			# beginning of victory checking
			if (@game_hash["A1"] == player_sign && @game_hash["A2"] == player_sign && @game_hash["A3"] == player_sign) || (@game_hash["B1"] == player_sign && @game_hash["B2"] == player_sign && @game_hash["B3"] == player_sign) || (@game_hash["C1"] == player_sign && @game_hash["C2"] == player_sign && @game_hash["C3"] == player_sign) || (@game_hash["A1"] == player_sign && @game_hash["B1"] == player_sign && @game_hash["C1"] == player_sign) || (@game_hash["A2"] == player_sign && @game_hash["B2"] == player_sign && @game_hash["C2"] == player_sign) || (@game_hash["A3"] == player_sign && @game_hash["B3"] == player_sign && @game_hash["C3"] == player_sign) || (@game_hash["A1"] == player_sign && @game_hash["B2"] == player_sign && @game_hash["C3"] == player_sign) || (@game_hash["A3"] == player_sign && @game_hash["B2"] == player_sign && @game_hash["C1"] == player_sign)
				
				show_game_visual
				puts
				puts("#{player_name} A GAGNÉ !")
				player_win_count = player_win_count + 1
				replay

				@victory = true
			else
				@victory = false
			end
			# end of victory checking
		
		end # method check_victory

		show_game_visual # shows current board

		def turn_player1 # perform player1 turn
			puts
			puts "C'EST À #{@player1_name} DE JOUER".blue
			puts "Sur quelle case voulez-vous jouer? (A1, A2, A3, B1, B2, B3, C1, C2, C3)"
			print "> "
			player_choice = gets.chomp.to_s # choose where to puts symbol

			
			# check answer validity
			if player_choice.to_s != "A1" && player_choice != "A2" && player_choice != "A3" && player_choice != "B1" && player_choice != "B2" && player_choice != "B3" && player_choice != "C1" && player_choice != "C2" && player_choice != "C3"
				puts "Choix incorrect"
				turn_player1
			else 

				# check place disponibility
				if @game_hash[player_choice] == " "
					@game_hash[player_choice] = @player1_sign
				else 
					puts "Cette case est déjà occupée, essayez encore"
					turn_player1
				end # check place disponibility
			
			end # check answer validity

			check_victory(@player1_name, @player1_sign, @player1_win_count)
			# check victory for player1 turn
		
		end # method turn_player1
		
		turn_player1 # perform turn_player1 method

		show_game_visual # shows current board

		def turn_player2 # perform player2 turn
			puts
			puts "C'EST À #{@player2_name} DE JOUER".red
			puts "Sur quelle case voulez-vous jouer? (A1, A2, A3, B1, B2, B3, C1, C2, C3)"
			print "> "
			player_choice = gets.chomp.to_s # choose where to puts symbol

			# check answer validity
			if player_choice.to_s != "A1" && player_choice != "A2" && player_choice != "A3" && player_choice != "B1" && player_choice != "B2" && player_choice != "B3" && player_choice != "C1" && player_choice != "C2" && player_choice != "C3"
				puts "Choix incorrect"
				turn_player2
			else

				# check place disponibility 
				if @game_hash[player_choice] == " "
					@game_hash[player_choice] = @player2_sign
				else 
					puts "Cette case est déjà occupée, essayez encore"
					turn_player2
				end # check place disponibility
			
			end # check answer validity

			check_victory(@player2_name, @player2_sign, @player2_win_count)
			# check victory for player2 turn
		
		end # method turn_player2
		
		turn_player2 # perform turn_player2 method
	
	end # method def one turn

	def full_game # perform full game

		while @victory != true # check if there is a winner
			one_turn
		end
	end

	def replay # ask for a new round
		puts
		puts "Vous avez joué #{@games_count} parties"
		puts
		puts "Voulez-vous rejouer ?"
		puts "Entrez 'oui' - 'non'"
		replay_choice = gets.chomp.to_s # require user answer to replay
		if replay_choice == "oui"
			@games_count += 1 # if yes, add round to game count
			game = Game.new(@player1_name, @player1_sign, @player2_name, @player2_sign, @games_count, @player1_win_count, @player2_win_count)
			game.full_game # and replay full game 
		elsif replay_choice == "non"
			abort # if no, stop the game
		end
	
	end # method replay

end #class Game