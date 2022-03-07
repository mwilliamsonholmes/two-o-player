

class Game < Question
  
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @active_player = @player1
  end

  def turn
    turn_number = 1
    while @player1.lives >= 0 && @player2.lives >= 0 do
      if turn_number % 2 === 0
      @active_player = @player2
      else 
        @active_player = @player1
      end
      if @player1.lives < 1
        puts "Player 2 wins with a score of #{@player2.lives}"
        puts "---- GAME OVER ----"
        break
      elsif @player2.lives < 1
        puts "Player 1 wins with a score of #{@player1.lives}"
        puts "---- GAME OVER ----"
        break
      else
        @question = Question.new
        puts "#{@active_player.player_name}: #{@question.get_question}"
        response = gets.chomp.to_i
        
        if response == @question.answer
          "YES! You are correct."
        else 
          puts "Seriously? No!"
          @active_player.lives -= 1
        end
      end
      turn_number += 1
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      puts "---- NEW TURN ----"
  end
end
end


