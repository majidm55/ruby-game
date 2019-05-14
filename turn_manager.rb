require_relative "player"

class TurnManager
  def initialize(player)
    @current_player = player
  end

  def start_turn
    answer = generate_question
    display_question(answer[0], answer[1])
    guess = take_guess
    correct_guess = validate_guess(guess, answer[0] + answer[1])
  end
  
  private

  def take_guess
    puts "#{@current_player.name}, please input your guess: "
    guess = gets.chomp.to_i
    return guess
  end

  def generate_question
    add1 = Random.new.rand(10)
    add2 = Random.new.rand(10)
    return [add1, add2]
  end

  def validate_guess(guess, answer)
    if guess != answer
      @current_player.lose_life
      puts "Wrong Answer! #{@current_player.name} Loses a Life. You have #{@current_player.lives} Lives Remaining!"
    else 
      puts "Correct Answer! #{current_player.name} has #{current_player.lives} Lives Remaining!"
    end
  end
end