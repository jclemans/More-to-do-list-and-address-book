require './lib/contact'
require './lib/phones'
require './lib/email'
require './lib/address'

@current_contact
@current_phone
@current_email
@current_address

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
  puts "Enter a number to view a contact"
  list_choice = gets.chomp.to_i
  @current_contact = Contact.all[list_choice - 1]
  puts Contact.all[list_choice - 1].name
  Contact.all[list_choice - 1].phone_array.each { |x| puts x.display }
  Contact.all[list_choice - 1].email_array.each { |x| puts x.display }
  Contact.all[list_choice - 1].address_array.each { |x| puts x.display }
  edit_menu
end

def edit_menu
  puts "Enter 'P' to add another phone number, 'E' for email, 'A' for address."
  puts "Enter 'C' to edit a phone number"
  puts "Enter 'D' to delete this contact"
  puts "Enter 'M' to return to main menu"
  edit_choice = gets.upcase.chomp
  if edit_choice == 'P'
    add_phone
  elsif edit_choice == 'E'
    add_email
  elsif edit_choice == 'A'
    add_address
  elsif edit_choice == 'C'
    change_phone
  elsif edit_choice == 'D'
    remove_contact
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

def remove_contact
  Contact.all.delete(@current_contact)
  puts "#{@current_contact.name} has been deleted.\n"
  main_menu
end

def add_phone
  puts "Enter the new phone number"
  new_phone = gets.chomp
  new_phone = Phone.create(new_phone)
  @current_contact.phones(new_phone)
  edit_menu
end

def add_email
  puts "Enter the new email address"
  new_email = gets.chomp
  new_email = Email.create(new_email)
  @current_contact.emails(new_email)
  edit_menu
end

def add_address
  puts "Enter the new address"
  new_address = gets.chomp
  new_address = Address.create(new_address)
  @current_contact.addresses(new_address)
  edit_menu
end

def change_phone
  puts "Enter the new number:"
  new_phone = gets.chomp
  @current_phone.edit(new_phone)
end

def show_contacts
  Contact.getnames.each_with_index do |name, index|
    puts "#{index + 1}" + ". #{name}"
  end
  list_menu
end


main_menu
