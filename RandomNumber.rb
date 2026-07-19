# frozen_string_literal: true

require "colorize"

random_number = rand(1..100)
count = 0
guessed_correctly = false

while count < 100
  print "Enter your guess between 1 and 100: "

  input = gets.chomp

  begin
    guess = Integer(input)
  rescue ArgumentError
    puts "Please enter a valid whole number.".red
    next
  end

  unless guess.between?(1, 100)
    puts "Your number must be between 1 and 100.".red
    next
  end

  count +=1

  if guess == random_number
    guessed_correctly = true

    puts "Correct! You found the number in #{count} guesses."

    break
  elsif guess < random_number
    puts "Your guess was too low."
  else
    puts "Your guess was too high."
  end
end

unless guessed_correctly
  puts "Sorry, you ran out of guesses.".red
  puts "The number was #{random_number}."
end