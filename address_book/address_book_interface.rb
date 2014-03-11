require './lib/contact'
require './lib/phones'
require './lib/email'
require './lib/address'

@current_contact

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
  @current_contact = Contact.all[list_choice - 1]
  puts Contact.all[list_choice - 1].name
  Contact.all[list_choice - 1].phone_array.each { |x| puts x.display }
  edit_menu
end

def edit_menu
  puts "Enter 'P' to add another phone number, 'E' for email, 'A' for address."
  puts "Enter 'M' to return to main menu"
  edit_choice = gets.upcase.chomp
  if edit_choice == 'P'
    add_phone
  elsif edit_choice == 'E'
    add_email
  elsif edit_choice == 'A'
    add_address
  elsif edit_choice == 'M'
    main_menu
  else
    puts "Please enter a valid command"
    edit_menu
  end
end

def add_contact
  puts "Enter contact name:"
  name = gets.chomp
  puts "Enter phone number:"
  phone_number = gets.chomp
  phone_number = Phone.create(phone_number)
  puts "Enter email address:"
  email_address = gets.chomp
  email_address = Email.create(email_address)
  puts "Enter mailing address:"
  address = gets.chomp
  address = Address.create(address)
  Contact.create(name, phone_number, email_address, address)

  main_menu
end

def add_phone
  puts "Enter the new phone number"
  new_phone = gets.chomp
  new_phone = Phone.create(new_phone)
  @current_contact.phones(new_phone)
  edit_menu
end

def show_contacts
  Contact.getnames.each_with_index do |name, index|
    puts "#{index + 1}" + ". #{name}"
  end
  list_menu
end


main_menu
