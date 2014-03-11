require './lib/address_book'
require './lib/phones'

def main_menu
  puts "Press 'C' to create a new contact."
  puts "Press 'D' to display all your contacts."
  puts "Press 'X' exit program."

  main_choice = gets.upcase.chomp
  if main_choice == 'C'
    add_contact
  elsif main_choice == 'D'
    show_contacts
  elsif main_choice == 'X'
    puts "Exiting Address Book. Goodbye."
  else
    puts "Invalid key. Please try again."
    main_menu
  end
end

def list_menu
  puts "Enter a number to edit a contact"
  list_choice = gets.chomp.to_i
  puts Contact.all[list_choice - 1].display
  main_menu
end

def add_contact
  puts "Enter contact name:"
  name = gets.chomp
  puts "Enter phone number:"
  phone = gets.chomp
  puts "Enter email address:"
  email = gets.chomp
  puts "Enter mailing address:"
  address = gets.chomp
  Contact.create(name, phone, email, address)
  main_menu
end

def show_contacts
  Contact.names?.each_with_index do |name, index|
    puts "#{index + 1}" + ". #{name}"
  end
  list_menu
end


main_menu
