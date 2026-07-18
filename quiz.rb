# Create an array containing question hashes
# Set score to zero
#
# Loop through every question
# Display the question
# Display every available option
# Ask the user for an answer
# Clean the answer
#
# If the answer is invalid
# Ask again
#
# If the answer matches the correct answer
# Display “Correct”
# Increase score
# Otherwise
# Display “Incorrect”
# Show the correct answer
#
# After all questions
# Display the final score

questions = [
  { id:1,
    text: "What is the capital of France?",
    options: ["A. paris", "B. london", "C. berlin", "D. madrid"],
    answer: "A"},
  {
    id: 2,
    text: "Which planet is known as the Red Planet?",
    options: ["A. earth", "B. mars", "C. jupiter", "D. saturn"],
    answer: "B"
  },
  {
    id: 3,
    text: "How many bones are there in an adult human body?",
    options: ["A. 106", "B. 206", "C. 306", "D. 406"],
    answer: "B"
  },
  {
    id: 4,
    text: "Which ocean is the largest and deepest on Earth?",
    options: ["A. atlantic ocean", "B. indian ocean", "C. arctic ocean", "D. pacific ocean"],
    answer: "D"
  },
  {
    id: 5,
    text: "In what year did the Titanic sink?",
    options: ["A. 1905", "B. 1912", "C. 1918", "D. 1923"],
    answer: "B"
  },
  {
    id: 6,
    text: "What is the only mammal capable of true, sustained flight?",
    options: ["A. bat", "B. flying squirrel", "C. sugar glider", "D. colugo"],
    answer: "A"
  }

]

user_score = 0
questions.each_with_index do |q, index|
  system("clear") || system("cls")

  puts "Question #{index + 1}: #{q[:text]}"

  q[:options].each do |option|
    puts #{option.upcase
  end
  answer = q[:answer]
  user_answer = nil

  loop do
    print "Please enter A, B, C, or D: "
    user_answer = gets.chomp.strip.upcase

    if ["A", "B", "C", "D"].include?(user_answer)
      break
    end

    puts "Please enter A, B, C, or D."
  end

  if answer == user_answer
    puts "Your answer is correct!"
    user_score += 1
  else
    puts "Incorrect. The correct answer is #{answer}."
  end

  # Compare the valid answer here
  unless index == questions.length - 1
    puts "\nPress Enter to see the next question..."
    gets
  end


end

puts "Final score: #{user_score} out of #{questions.length}"