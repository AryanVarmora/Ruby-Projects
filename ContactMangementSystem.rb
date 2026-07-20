# frozen_string_literal: true

class Contact
  def initialize
    @contacts = []
  end
  def add_contact
    puts "Enter contact name"
    name = gets.chomp.strip
    puts "Enter phone number"
    phone = gets.chomp
    puts "Enter email"
    email = gets.chomp.strip
    contact = {
      name: name,
      phone: phone,
      email: email
    }
    @contacts << contact
    puts "Contact added successfully."
  end

  def view_contacts
    if @contacts.empty?
      puts "No contacts found"
    else
      @contacts.each_with_index do |contact, index|
        puts "#{index + 1}. Name: #{contact[:name]}"
        puts "Phone: #{contact[:phone]}"
        puts "Email: #{contact[:email]}"
        puts "--------------------"
      end
    end
  end
  def search_contacts
    puts "Enter a name, phone number, or email to search:"
    search_contact = gets.chomp.strip.downcase
    results = @contacts.select do |contact|
      contact[:name].downcase.include?(search_contact) ||
      contact[:phone].include?(search_contact)||
      contact[:email].downcase.include?(search_contact)
    end
    puts "\n--- Search Results ---"
    if results.empty?
      puts "No results found"
    else
      results.each_with_index do |contact|
        puts "Name: #{contact[:name]}"
        puts "Phone: #{contact[:phone]}"
        puts "Email: #{contact[:email]}"
        puts "--------------------"
      end
    end
  end

  def delete_contact
    if @contacts.empty?
      puts "No contacts to delete."
      return
    end

    @contacts.each_with_index do |contact, index|
      puts "#{index + 1}. #{contact[:name]}"
    end

    print "Enter the contact number you want to delete: "
    contact_number = gets.chomp.to_i

    unless contact_number.between?(1, @contacts.length)
      puts "Invalid contact number."
      return
    end

    deleted_contact = @contacts.delete_at(contact_number - 1)

    puts "#{deleted_contact[:name]} was deleted successfully."
  end

end
contact_book = Contact.new
loop do
  puts "Please select from the menu"
  puts "1. Add contact"
  puts "2. View contact"
  puts "3. Search contact"
  puts "4. Delete contact"
  puts "5. Exit"

  menu = gets.chomp.to_i

  case menu
  when 1
    puts "Please Enter the following information"
    contact_book.add_contact
  when 2
    contact_book.view_contacts
  when 3
    contact_book.search_contacts
  when 4
    contact_book.delete_contact
  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid option. Please choose 1, 2, 3, or 4."
  end

end