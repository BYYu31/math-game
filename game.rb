require './player'
require './question'

class Game
  attr_accessor :current_player, :player1, :player2
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = 1
  end 

  def start
    puts "Are you ready #{player1.name} and #{player2.name}? \n Let's start the game!"
    new_round
  end

  def new_round
    new_q = Question.new
    new_question = new_q.question
    new_answer = new_q.answer

    puts "Player #{current_player} asks: #{new_question}"
    print ">"
    input = $stdin.gets.chomp
    player_to_answer = current_player == 1 ? 2 : 1
    true_or_false(input.to_i, new_answer, player_to_answer)
    update_score

    puts '------ NEW TURN ------'
    change_current_player
  end

  def true_or_false(player_answer, correct_answer, player)
    if player_answer == correct_answer
      puts "Good job!"
    else
      puts "Well, that was an attempt"
      if player == 1
        player1.health -= 1
      else
        player2.health -= 1
      end
    end
  end

  def update_score
    if player1.health > 0 && player2.health > 0
      puts "Player1: #{player1.health}/3 vs Player2: #{player2.health}/3"
    else
      if player1.health == 0
        puts "Player 2 wins with a score of #{player2.health}"
      else 
        puts "Player 1 wins with a score of #{player1.health}"
      end
      puts '------ GAME OVER ------'
      puts 'Bye bye now!'
      exit(0)
    end
  end

  def change_current_player
    if current_player == 1
      current_player = 2
    else
      current_player = 1
    end
    new_round
  end
end

new_game = Game.new
new_game.start