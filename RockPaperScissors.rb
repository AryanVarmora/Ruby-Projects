# frozen_string_literal: true

valid_moves = ["rock", "paper", "scissors"]
user_score = 0
computer_score = 0
loop do
  puts "Please enter your move: rock, paper, or scissors."
  user_move = gets.chomp.strip.downcase

  unless valid_moves.include?(user_move)
    puts "Please select a valid move."
    next
  end

  computer_move = valid_moves.sample
  puts "Your Move: #{user_move}"
  puts "Computer's move is: #{computer_move}"
  if computer_move == user_move
    puts "It's a draw"
  elsif computer_move == "rock" && user_move == "scissors"
    puts "Computer wins this round!"
    computer_score +=1
  elsif computer_move == "scissors" && user_move == "paper"
    puts "Computer wins this round!"
    computer_score +=1
  elsif computer_move == "paper" && user_move == "rock"
    puts "Computer wins this round!"
    computer_score +=1
  else
    puts "You win this round!"
    user_score +=1
  end
  puts "Your score: #{user_score}"
  puts "Computer score: #{computer_score}"

  if computer_score >=3
    puts "Computer wins this game!"
    break
  elsif user_score >= 3
    puts "You win this game!"
    break
  end
end