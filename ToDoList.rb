# frozen_string_literal: true
# Create an empty array

# Start the menu loop

# Display menu

# Read the user's choice

# If choice is 1:
# Ask for a task
# Add task to array

# If choice is 2:
# Check whether array is empty
# Otherwise display every task

# If choice is 3:
# Display goodbye
# Stop the loop

# Otherwise:
# Display invalid choice

tasks = []

loop do
  puts "Select an option:"
  puts "1. Add a task"
  puts "2. View tasks"
  puts "3. Remove a task"
  puts "4. Exit"

  menu = gets.chomp.to_i

  case menu
  when 1
    puts "Please type your daily task:"
    input = gets.chomp
    tasks << input
    puts "Task added successfully."

  when 2
    if tasks.empty?
      puts "You have no tasks."
    else
      tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
  when 3
    if tasks.empty?
      puts "You have no tasks to remove."
      next
    end

    tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end

    print "Enter the number of the task you want to delete: "
    task_number = gets.chomp.to_i

    if task_number.between?(1, tasks.length)
      removed_task = tasks.delete_at(task_number - 1)
      puts "Removed: #{removed_task}"
    else
      puts "Invalid task number."
    end
  when 4
    puts "Goodbye!"
    break

  else
    puts "Invalid option. Please choose 1, 2, 3 or 4."
  end
end